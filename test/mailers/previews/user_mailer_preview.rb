class UserMailerPreview < ActionMailer::Preview
    def confirmation_email
      UserMailer.confirmation_email(User.last, Order.last)
    end
   end