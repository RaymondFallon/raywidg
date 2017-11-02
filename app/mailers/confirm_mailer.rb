class ConfirmMailer < ApplicationMailer
  default from: 'ray@raywidg.com'

  def conf_email(widget)
    @widget = widget
    mail(to: @widget.email, subject: 'Widget Order Confirmation')
  end
end
