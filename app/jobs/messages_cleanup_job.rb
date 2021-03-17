class MessagesCleanupJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.delete
  end
end
