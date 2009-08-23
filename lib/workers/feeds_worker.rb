class FeedsWorker < BackgrounDRb::Rails

  set_worker_name :feeds_worker

  def create(args = nil)
    # Gets called when the worker is created.
  end
  
  def do_work(args)
    # This method is called in it's own new thread when you
    # call new worker. args is set to :args
  end

end
