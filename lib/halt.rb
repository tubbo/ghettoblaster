
# Render errors consistently throughout your API

module Halt
  ERRORS = {
    200 => "An unknown error has occurred.",
    404 => "The resource could not be found.",
    403 => "You are forbidden to see this resource.",
    401 => "Unauthorized access to a resource."
  }

  # Halts the application and renders a JSON response
  def halt options={}
    status = options[:status] || 200
    json_response = {
      json: options,
      status: status
    }.merge options

    render json_response and return
  end
end
