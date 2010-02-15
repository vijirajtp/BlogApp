class UserMailer < ActionMailer::Base

  def registration_confirmation(user)
    recipients user.email
    from       "web@webmaster.com"
    subject    "Thank you for registering"
    body       :user => user
  end

  def contact_notifier(contact)
    recipients contact.email
    from       "web@webmaster.com"
    subject    "Thank you"
    body       :contact => contact
  end

  

end
