class UserSessionsController < Devise::SessionsController
	before_filter :authenticate_user!
	def new

	end
	def create
		if user_signed_in?
			redirect_to "/attachments/create"
		end
	end
end