ActiveAdmin.register Blast do
  index do
    column :subject
    default_actions
  end

  form do |f|
    f.inputs :subject, :body
  end

  show do |email|
    h3 email.subject
    h4 "Sent on #{email.sent_at}"

    para email.body
  end
end
