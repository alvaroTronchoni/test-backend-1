class ApplicationMailer < ActionMailer::Base
  	default from: 'from@example.com'

  	def new_task_with_email(title, email, inicio, fin) 

  		@title = title
  		@inicio = @inicio
  		@fin = @fin

  		mail(to: email, subject: 'Nueva tarea programada')

  	end
end
