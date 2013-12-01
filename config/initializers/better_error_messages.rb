require 'active_record/better_error_messages'

# Comma-separated errors in AR

ActiveRecord::Base.send :include, ActiveRecord::BetterErrorMessages
