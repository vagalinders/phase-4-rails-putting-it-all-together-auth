class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid


  def render_invalid(exception)
    render json: {error: exception.record.errors.full_messages}
  end

end