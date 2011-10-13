module EvelpidonTestHelpers
  # +ActiveModel+ related helpers
  module ActiveModel
    # Asserts that the given ++ActiveModel++ is "valid".
    # If not, the error message is the full error messages.
    def assert_valid(object, additional_message = nil)
      is_valid = object.valid?
      error_message = additional_message ?
          "#{additional_message}\n\nErrors:\n\n#{object.errors.full_messages.join("\n")}\n\n" :
          "Errors:\n#{object.errors.full_messages.join("\n")}\n\n"
      assert is_valid, error_message
    end

    # Asserts that the given +attribute+ on the given +ActiveModel+ contains no errors.
    # If not, the error message is the joint string of the errors on this +attribute+.
    def assert_valid_attribute(object, attribute, message = "")
      object.valid?
      errors_on_attribute = object.errors[attribute].length
      error_messages = object.errors[attribute].join(',')
      message << "\nExpected zero errors on #{attribute} but got #{errors_on_attribute} :\n#{error_messages}"
      assert_equal 0, errors_on_attribute, message
    end

    # Asserts that the given ++ActiveModel++ is "invalid".
    # The ++attributes_with_errors++ options should a hash of attributes to be specifically
    # examined for having errors. For example : {:email => 1, :username => 2} (etc).
    def assert_invalid(object, attributes_with_errors = {})
      assert object.invalid?, "Expected #{object} to be invalid, but was actually valid"

      attributes_with_errors.each do |attribute, expected_number_of_errors|
        actual_errors_on_attribute = object.errors[attribute].length
        error_message = "Expected #{expected_number_of_errors} errors on #{attribute}, but were actually #{actual_errors_on_attribute} : \n"
        error_message << "#{object.errors[attribute].join("\n")}"
        assert_equal expected_number_of_errors, actual_errors_on_attribute, error_message
      end
    end

    # Asserts that the given +attribute+ on the given +ActiveModel+ contains at least one error.
    def assert_invalid_attribute(object, attribute, message = "")
      object.valid?
      errors_on_attribute = object.errors[attribute].length
      error_messages = object.errors[attribute].join(',')
      message << "\nExpected at least one error on #{attribute} but got #{errors_on_attribute} :\n#{error_messages}"
      assert errors_on_attribute > 0, message
    end

    # Asserts that the given +attributes+ result to a valid +ActiveModel+ instance.
    #
    # This helper chooses the model name based on the current test name, so for example
    # when the test that is running is named FooTest it will try to instantiate a new Foo
    # model, update the attributes (by-passing mass assignment protection) and then call
    # +assert_valid+ on it.
    def assert_valid_model_attributes(attributes)
      model = self.class.to_s.gsub("Controller", "").gsub("Test", "").constantize
      instance = model.new

      attributes.each do |attribute_name, attribute_value|
        instance.send("#{attribute_name}=", attribute_value)
      end

      assert_valid instance, instance.inspect
    end

    # Asserts that all the records for the current model under test are valid.
    #
    # This helper chooses the model name based on the current test name, so for example
    # when the test that is running is named FooTest it will try to load all the records of Foo
    # through Foo.all and then call +assert_valid+ on each one of them.
    def assert_valid_fixtures
      model = self.class.to_s.gsub("Controller", "").gsub("Test", "").constantize
      model.all.each do |fixture|
        assert_valid fixture, fixture.inspect
      end
    end

    # Asserts that the given +attribute+ on the given +model+ cannot be assigned through
    # mass-assignment (like +update_attributes).
    #
    # @param model [ActiveModel] A properly initialized instance of the class that we want to test.
    # @param attribute [Symbol] The attribute that is protected
    # @param value [Object] An optional value to use when trying to assign the attribute.
    def assert_attribute_protected(model, attribute, value = "foo")
      model.send("#{attribute}=", nil)
      model.attributes = {attribute => value}
      assert_nil model.send(attribute), "#{attribute} could be set through 'update_attributes' call"

      model.send("#{attribute}=", value)
      assert_equal value, model.send(attribute)
    end

    # Asserts that the given +observer+ class will receive the +notification+.
    #
    # @param observer [Class] the observer class
    # @param notification [Symbol] the notification
    # @param options [Hash] extra options :
    #   * :object [Object, Mocha::ParameterMatchers::Base] the object that should be passed to the observer.
    #   * :times [Integer] the number of times that the notification should be sent to the observer.
    #
    def assert_observer_notified(observer, notification, options = {})
      options.reverse_merge!(:times => 1, :object => anything)
      observer.instance.expects(notification).with(options[:object]).times(options[:times])
    end

    # Asserts that the given +observer+ class will never receive the +notification+.
    #
    # @param observer [Class] the observer class
    # @param notification [Symbol] the notification
    # @param options [Hash] extra options
    #
    def assert_observer_not_notified(observer, notification, options = {})
      observer.instance.expects(notification).never
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::ActiveModel
  end
end if defined?(ActiveModel)
