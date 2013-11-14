ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)

Rails.application.config.active_record.whitelist_attributes = false
