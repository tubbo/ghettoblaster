class Blast < ActiveRecord::Base
  validates :subject, presence: true
  validates :body, presence: true

  after_save :deliver, :if => :published_and_not_sent?

  def published_and_not_sent?
    published? && (not sent?)
  end

  def sent?
    self.sent_at.present?
  end

  def deliver
    return false unless deliverable?
    BlastMailer.announcement(self).deliver! and
    update_attributes sent_at: Time.now
  end

  def published?
    !!is_published?
  end

  def deliverable?
    return false unless valid?

    errors.add :base, "is not published" unless published?
    errors.add :base, "has already been sent" if sent?

    errors.empty?
  end
end
