class Blast < ActiveRecord::Base
  attr_accessible :body, :subject, :is_published
  validates_presence_of :body, :subject

  after_save :deliver_if_published

  def sent?
    self.sent_at.present?
  end

  def published?
    self.is_published
  end

  private
  def deliver_if_published
    logger.debug "Message already sent." and return \
      if sent?
    logger.warn "Message not sent: Not published." and return \
      unless published?

    BlastDeliveryWorker.perform_async id
  end
end
