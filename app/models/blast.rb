class Blast < ActiveRecord::Base
  validates :subject, presence: true
  validates :body, presence: true

  def sent?
    self.sent_at.present?
  end

  def deliver
    return false unless deliverable?
    update_attributes sent_at: Time.now
    BlastMailer.announcement(self).deliver!
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
