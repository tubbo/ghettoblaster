ActiveAdmin.register_page "Dashboard" do
  menu :priority => 1, :label => "Overview"

  content title: "Welcome to your Ghettoblaster" do
    para "This is your admin panel. From here, you can see your entire email subscription list (and make changes) as well as compose new messages."
  end
end
