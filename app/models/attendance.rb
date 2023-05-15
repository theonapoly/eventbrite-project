class Attendance < ApplicationRecord
    belongs_to :participants, class_name: "user"
    belongs_to :event, class_name: "event"
    
    
end
