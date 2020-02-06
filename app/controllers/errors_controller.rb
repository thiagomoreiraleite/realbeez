class ErrorsController < ApplicationController

  # def not_found
  #   render status: 404
  # end

  # def unacceptable
  #   render status: 422
  # end

  # def server_error
  #   render status: 500
  # end

  def error
    render status_code.to_s, status: (params[:code] || 500)
  end

end
