ActiveAdmin.register_page "Dashboard" do


  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        render 'analytics'
      end
      column do
        render 'heroku'
      end
      column do
        render 'sendgrid'
      end
      column do
        render 'sendinblue'
      end
      column do
        render 'staging'
      end
    end
  end
end
