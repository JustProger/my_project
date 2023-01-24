# frozen_string_literal: true

# ApplicationMailer docs
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
