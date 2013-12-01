module ActiveRecord
  module BetterErrorMessages
    def error_messages
      self.errors.full_messages.join ', '
    end
  end
end
