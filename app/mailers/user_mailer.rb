class UserMailer < ApplicationMailer

  def user_order_status(email, name, title, price)
    @email = email
    @name = name
    @title = title
    @price = price
    mail(to: @email, subject: "Successfully updated order status")
  end
end
