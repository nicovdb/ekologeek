class ApplicationMailer < ActionMailer::Base

  default from: ENV['EMAIL']
  layout 'mailer'
  add_template_helper(EmailHelper)

end
