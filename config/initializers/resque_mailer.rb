# Store mailings in the 'blast_deliveries' queue
Resque::Mailer.default_queue_name = 'blast_deliveries'

# Exclude Resque::Mailer in test
Resque::Mailer.excluded_environments = [:test]
