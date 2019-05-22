class EmailNotifierJob < ApplicationJob
  queue_as :default

  def perform(title, email, inicio, fin)
    ApplicationMailer.new_task_with_email(title, email, inicio, fin).deliver
  end
end
