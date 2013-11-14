class Blast < ActiveRecord::Base
  validates :subject, presence: true
  validates :body, presence: true

  def sent?
    self.sent_at.present?
  end

  def deliver
    return false unless deliverable?
    BlastDeliveryWorker.perform_async id
  end

  def published?
    !!self.is_published
  end

  def deliverable?
    return false unless valid?
    errors.add :base, "is not published" unless published?
    errors.add :base, "has already been sent" if sent?
    errors.any?
  end
end
