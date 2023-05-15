class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.belongs_to :participants, class_name: "User", index:true
      t.belongs_to :event, class_name: "Event", index:true

      t.timestamps
    end
  end
end
