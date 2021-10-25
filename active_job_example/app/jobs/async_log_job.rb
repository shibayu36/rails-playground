class AsyncLogJob < ApplicationJob
  queue_as :async_log
  retry_on StandardError, wait: 5.seconds, attempts: 3

  def perform(message: 'hello')
    AsyncLog.create!(message: message)
  end
end
