class BlastDeliveryWorker
  include Sidekiq::Worker

  def perform blast_id
    blast = Blast.find blast_id
    return false unless blast.present?

    BlastMailer.announcement(blast).deliver!
    blast.update_attributes sent_at: DateTime.now
  end
end
