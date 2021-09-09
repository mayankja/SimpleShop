class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.mailer[:sender]
  layout 'mailer'
end
