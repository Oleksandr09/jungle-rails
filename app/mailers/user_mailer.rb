class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def confirmation_email(user, order)
        @user = user
        @order = order
        mail(to: @user.email, subject: "Your order: #{order.id}")
    end
end
