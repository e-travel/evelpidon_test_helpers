module EvelpidonTestHelpers
  module ActionController
    # Asserts that the controller assigned an instance variable with the given +instance_variable_name+
    # and optionally checks that it's 'is equal with the given +expected_value+.
    def assert_assigns(instance_variable_name, expected_value = nil)
      assert_not_nil assigns(instance_variable_name), "#{instance_variable_name} was not assigned."
      unless expected_value.nil?
        assert_equal expected_value, assigns(instance_variable_name)
      end
    end
  end
end


module ActionController
  class TestCase
    include EvelpidonTestHelpers::ActionController
  end
end if defined?(ActionController)
