ActiveAdmin.register_page "Dashboard" do
  menu :priority => 1, :label => "Overview"

  content title: "Welcome" do
    h2 "Welcome to your Ghettoblaster"
    h3 "This is your admin panel."
    h3 "From here, you can see your entire email subscription list (and make changes) as well as compose new messages."
  end
end
