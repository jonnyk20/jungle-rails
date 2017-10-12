class ReceiptMailer < ApplicationMailer
  default from: "from@example.com"
  def receipt_email(order)
    @order = order
    @line_items = @order.line_items.order(created_at: :desc)
    mail(from: 'no-reply@jungle.com',to: 'jonnyk20@gmail.com', subject: 'Receipt: Order -'+@order.id.to_s)
  end
end
