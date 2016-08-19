class Email < ActiveRecord::Base

  def total_sent
    Email.where(event: 'send').count
  end  

  def total_opened
    Email.where(event: 'open').count
  end

  def total_clicked
    Email.where(event: 'click').count
  end

end
