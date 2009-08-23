require File.dirname(__FILE__) + '/../test_helper'
require "#{RAILS_ROOT}/vendor/plugins/backgroundrb/backgroundrb.rb"
require "#{RAILS_ROOT}/lib/workers/feeds_worker"
require 'drb'

class FeedsWorkerTest < Test::Unit::TestCase

  # Replace this with your real tests.
  def test_truth
    assert FeedsWorker.included_modules.include?(DRbUndumped)
  end
end
