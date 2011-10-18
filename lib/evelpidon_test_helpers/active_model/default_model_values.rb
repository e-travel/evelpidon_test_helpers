module EvelpidonTestHelpers
  module ActiveModel
    module DefaultModelValues
      module Assertions
        def assert_default_value(object, attribute, value)
          assert_valid_attribute object, attribute.to_sym
          assert_equal value, object.send(attribute.to_sym)
        end

        def assert_default_model_value(attribute, value)
          model = self.class.to_s.gsub("Controller", "").gsub("Test", "").constantize
          instance = model.new

          assert_default_value(instance, attribute, value)
        end
      end
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::ActiveModel::DefaultModelValues::Assertions
  end
end if defined?(ActiveModel)
