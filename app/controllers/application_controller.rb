class ApplicationController < ActionController::API
	include ActionController::Cookies

rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid

	private

	def record_not_valid(exception)
		render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
	end

end
