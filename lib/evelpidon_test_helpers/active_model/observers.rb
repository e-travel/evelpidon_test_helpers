module EvelpidonTestHelpers
  module ActiveModel
    module Observers
      module Assertions
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
  end
end

module ActiveSupport
  class TestCase
    include EvelpidonTestHelpers::ActiveModel::Observers::Assertions
  end
end if defined?(ActiveModel)
