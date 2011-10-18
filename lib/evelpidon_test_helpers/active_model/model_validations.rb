module EvelpidonTestHelpers
  module ActiveModel
    module ModelValidations
      module Assertions
        # Asserts that the given ++ActiveModel++ is "valid".
        # If not, the error message is the full error messages.
        def assert_valid(object, additional_message = nil)
          is_valid = object.valid?
          error_message = additional_message ?
              "#{additional_message}\n\nErrors:\n\n#{object.errors.full_messages.join("\n")}\n\n" :
              "Errors:\n#{object.errors.full_messages.join("\n")}\n\n"
          assert is_valid, error_message
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
      end
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::ActiveModel::ModelValidations::Assertions
  end
end if defined?(ActiveModel)
