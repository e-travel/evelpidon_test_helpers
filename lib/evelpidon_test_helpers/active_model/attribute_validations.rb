module EvelpidonTestHelpers
  module ActiveModel
    module AttributeValidations
      module Assertions
        # Asserts that the given +attribute+ on the given +ActiveModel+ contains no errors.
        # If not, the error message is the joint string of the errors on this +attribute+.
        def assert_valid_attribute(object, attribute, message = "")
          object.valid?
          errors_on_attribute = object.errors[attribute].length
          error_messages = object.errors[attribute].join(',')
          message << "\nExpected zero errors on #{attribute} but got #{errors_on_attribute} :\n#{error_messages}"
          assert_equal 0, errors_on_attribute, message
        end

        # Asserts that the given +attribute+ on the given +ActiveModel+ contains at least one error.
        def assert_invalid_attribute(object, attribute, message = "")
          object.valid?
          errors_on_attribute = object.errors[attribute].length
          error_messages = object.errors[attribute].join(',')
          message << "\nExpected at least one error on #{attribute} but got #{errors_on_attribute} :\n#{error_messages}"
          assert errors_on_attribute > 0, message
        end
      end
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::ActiveModel::AttributeValidations::Assertions
  end
end if defined?(ActiveModel)
