module EvelpidonTestHelpers
  module ActiveModel
    module MassAssignment
      module Assertions
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
      end
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::ActiveModel::MassAssignment::Assertions
  end
end if defined?(ActiveModel)
