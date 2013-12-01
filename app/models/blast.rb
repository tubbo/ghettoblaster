class Blast < ActiveRecord::Base
  validates :subject, presence: true
  validates :body, presence: true
  validate  :sent_blast_cant_be_deleted, :on => :destroy

  after_save :deliver, :if => :published_and_not_sent?

  def published_and_not_sent?
    published? && (not sent?)
  end

  # Tests whether this Blast has been sent, by first testing for the
  # presence of the sent_at attribute.
  def sent?
    self.sent_at.present?
  end

  # Enqueues this Blast as a message for delivery with ResqueMailer.
  def deliver
    return false unless deliverable?
    BlastMailer.announcement(self).deliver! and
    update_attributes sent_at: Time.now
  end

  # An absolutely boolean value of is_published.
  def published?
    !!is_published?
  end

  # Tests whether this Blast can be delivered, storing errors and
  # returning `false` when it can not. It returns `true` when it can be
  # delivered.
  def deliverable?
    run_delivery_validations and log_sent_at_timestamp
  end

  private
  def sent_blast_cant_be_deleted
    errors.add :base, "can not be deleted if already sent" if sent?
  end

  def run_delivery_validations
    return false unless valid?

    errors.add :base, "is not published" unless published?
    errors.add :base, "has already been sent" if sent?

    errors.empty?
  end

  def log_sent_at_timestamp
    update_attributes sent_at: DateTime.now
  end
end
