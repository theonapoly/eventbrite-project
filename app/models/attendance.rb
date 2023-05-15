class Attendance < ApplicationRecord
    after_create :attendance_send
    
    belongs_to :participants, class_name: "User"
    belongs_to :event, class_name: "Event"
    
    
end
