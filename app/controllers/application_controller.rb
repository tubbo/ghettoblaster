require 'halt'

# Methods that apply to all controllers.

class ApplicationController < ActionController::Base
  include Halt

  protect_from_forgery
end
