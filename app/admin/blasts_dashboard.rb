ActiveAdmin.register Blast do
  index do
    column :subject
    default_actions
  end

  form do |f|
    f.inputs :subject, :body
    f.inputs do
      f.input :is_published, \
        label: 'Publish?',
        hint: "Select this if you wish to send out the Blast to all subscribers right now."
    end
    f.actions
  end

  show do |email|
    h3 email.subject
    h4 "Sent on #{email.sent_at}"

    para email.body
  end
end
