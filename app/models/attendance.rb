class Attendance < ApplicationRecord
  after_create :confirmation

  def confirmation
    UserMailer.attendance_confirmation(self).deliver_now
  end 
  
  belongs_to :user
  belongs_to :event
end
