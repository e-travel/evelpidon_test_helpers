module EvelpidonTestHelpers
  module Date
    # Asserts that the two ++Time++ or ++DateTime++ refer to same Date/Month/Year.
    def assert_equal_date(expected, actual)
      assert_equal expected.strftime("%j%Y"), actual.strftime("%j%Y")
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::Date
  end
end
