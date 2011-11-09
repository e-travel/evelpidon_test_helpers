# Evelpidon Test Helpers for Rails projects
[![Project Status](http://stillmaintained.com/e-travel/evelpidon_test_helpers.png)](http://stillmaintained.com/e-travel/evelpidon_test_helpers)
[![Build Status](https://secure.travis-ci.org/e-travel/evelpidon_test_helpers.png)](http://travis-ci.org/e-travel/evelpidon_test_helpers)


Collection of various Test::Unit / ActiveSupport::Test helpers, mainly for Rails projects.

## Features

* ActiveModel helpers
  * assert_valid
  * assert_valid_attribute
  * assert_invalid
  * assert_invalid_attribute
  * assert_valid_model_attributes
  * assert_valid_fixtures
  * assert_attribute_protected
  * assert_observer_notified
  * assert_observer_not_notified
* ActionController helpers :
  * assert_assigns
* Generic helpers (for example for Date/Time objects) :
  * assert_equal_date
* [Sunspot mocking](http://timcowlishaw.co.uk/post/3179661158/testing-sunspot-with-test-unit)

## Installation

You can install it easy using rubygems:

    gem install evelpidon_test_helpers

Or using bundler

    gem 'evelpidon_test_helpers'

## Usage

Test helpers get included automatically depending on the loaded gems.
So if you have already required somewhere ActiveModel, then the ActiveModel related helpers will be loaded.
If you have already required ActionController, ActionController helpers will be loaded, etc.

The only exception so far is the TestSunspot which to actually work you have to
call it in your setup method. So for example in your test_helpers.rb :

    setup do
      EvelpidonTestHelpers::TestSunspot.setup
    end

## TODOs

* Generic documentation for usage
* Specific code documentation
* Tests (?)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally (not really...).
* Commit, do not mess with gemspec, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send a pull request. Bonus points for topic branches.

## Author(s)

* [Nikos Dimitrakopoulos](http://github.com/nikosd)
* [Panayotis Matsinopoulos](http://github.com/pmatsinopoulos)
* [Eric Cohen](http://github.com/eirc)

## Copyright

* Copyrignt (c) 2011 [Fraudpointer.com](http://www.fraudpointer.com)
* Copyrignt (c) 2011 [E-Travel S.A.](http://www.airtickets24.com)

## License

Evelpidon Test Helpers are released under the MIT license.
See [LICENSE](/e-travel/evelpidon_test_helpers/blob/master/LICENSE) for more details.
