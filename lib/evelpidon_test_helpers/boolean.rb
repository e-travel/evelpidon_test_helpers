module EvelpidonTestHelpers
  module Boolean
    # Asserts that the given value is a boolean.
    def assert_kind_of_boolean(expected)
      assert expected == true || expected == false, "#{expected} expected to be a boolean"
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::Boolean
  end
end
