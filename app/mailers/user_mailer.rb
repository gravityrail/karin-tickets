class UserMailer < ActionMailer::Base
  default :from => "Karin Muiznieks <info@karin.com.au>"
  
  def purchased_ticket(transaction)
    mail(:to=>transaction.email,:subject=>'Your ticket purchase')
  end
end
