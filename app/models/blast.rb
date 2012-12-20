class Blast < ActiveRecord::Base
  attr_accessible :body, :subject, :is_published
  validates_presence_of :body, :subject

  before_save :send_message

  def sent?
    self.sent_at.present?
  end

  def published?
    self.is_published
  end

private
  def send_message
    logger.debug "Message already sent." and return \
      if sent?
    logger.warn "Message not sent: Not published." and return \
      unless published?

    self.sent_at = DateTime.now
    logger.info "Message sent to all subscribers."
  end
end
