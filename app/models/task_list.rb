class TaskList < ApplicationRecord


	validates :title, :start_date, :end_date, :presence => true

	validate :email_validator

	validate :correct_date

	validate :unique_date

	# metodo para validar que si hay email sea de un formato valido
	def email_validator
		if email != '' 
			if !(email =~ (/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i))
				errors.add(:email, "El email no tiene el formato correcto")
			end
		end
	end

	#metodo para ver que la fecha de inicio es menor a la fecha de fin
	def correct_date
	    if end_date < start_date
	      	errors.add(:end_date, "La fecha de fin no puede ser menor que la de inicio")
	    end
  	end

  	#metodo para comprovar que las fechas no se solapan
  	def unique_date


  		if TaskList.where("(? > start_date AND ? < end_date) OR (? < start_date AND ? > end_date)", start_date, start_date, end_date, end_date).count != 0
  			errors.add(:end_date, "El intervalo de fechas no puede estar ocupado")
  		end
  		
  	end

end
