class ApplicationMailer < ActionMailer::Base
  default from: "blocipedia@bloc.io"
  layout 'mailer'


  # mail(to: user.email, subject: "Confirm Sign Up to Blocipedia")
end
