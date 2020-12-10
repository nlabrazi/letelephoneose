class ContactsController < ApplicationController
	before_action :skip_authorization
 
	def new 
		@contact = Contact.new
	end
	
	def create 
		@contact = Contact.new(params[:contact])
		@contact.request = request
		@contact.message += "\nEcrit par : " + @contact.email
		@contact.email = 'le.telephone.ose@yopmail.com'
		if @contact.deliver
			flash.now[:error] = nil
		else
			flash.now[:error] = 'Cannot send message'
			render :new
		end
	end
	
end
