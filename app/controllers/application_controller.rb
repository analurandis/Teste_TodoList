class ApplicationController < ActionController::API
  
  rescue_from ActionController::RoutingError, with: lambda { |exception| render_error(404, exception) }

  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    logger.debug { "---> I catch you #{request.remote_ip}" }
    render json: {status: '400', message:'Rota Inexistente'},status: 400
  end


  acts_as_token_authentication_handler_for User
 
before_action :require_authentication!
 
private
 
def require_authentication!
 
  throw(:warden, scope: :user) unless current_user.presence
 
end

end
