
# Render errors consistently.

module Halt
  ERRORS = {
    200 => "An unknown error has occurred.",
    404 => "The resource could not be found.",
    403 => "Unauthorized access."
  }

  # Halts the application and renders a JSON response
  def halt options={}
    status = options[:status] || 200
    error_response = {
      json: options.merge(error: true),
      status: status
    }.merge options

    render error_response and return
  end
end
