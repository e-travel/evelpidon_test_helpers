module EvelpidonTestHelpers
  module ActiveModel
    module Fixtures
      module Assertions
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
      end
    end
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::ActiveModel::Fixtures::Assertions
  end
end if defined?(ActiveModel)
