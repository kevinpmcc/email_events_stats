class Email < ActiveRecord::Base

  def total_sent
    Email.where(event: 'send').count
  end  

end
