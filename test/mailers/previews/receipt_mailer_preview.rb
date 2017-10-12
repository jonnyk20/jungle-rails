# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ReceiptMailerPreview < ActionMailer::Preview
  def receipt_mail_preview
    ReceiptMailer.receipt_email()
  end
end