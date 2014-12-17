require 'bots/feed_grabber'

class FeedsWorker < BackgrounDRb::MetaWorker

  set_worker_name :feeds_worker

  def create(args = nil)
    # Gets called when the worker is created.
  end

  def do_work(feed_id)
    # This method is called in it's own new thread when you
    # call new worker. args is set to :args

    helper = FeedGrabber.new( feed_id )
    helper.go

    story_helper = StoryGrabber.new( feed_id )
    story_helper.go

    persistent_job.finish
  end
end
