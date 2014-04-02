ActiveAdmin.register Blast do
  index do
    column :subject
    default_actions
  end

  form do |f|
    f.input :subject
    f.input :body
    f.input :is_published, label: "Publish? (note: checking this means that you want the mail to be sent right now)"

    f.actions
  end

  show do |email|
    h3 email.subject
    h4 "Sent on #{email.sent_at}"

    para email.body
  end
end
