class ConfirmMailer < ApplicationMailer
  default from: 'ray@raywidg.com'

  def conf_email(widget)
    @widget = widget
    @url = widget_url(@widget, host: 'localhost:3000')
    mail(to: @widget.email, subject: 'Widget Order Confirmation')
  end
end
