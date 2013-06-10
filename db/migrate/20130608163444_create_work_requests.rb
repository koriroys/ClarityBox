class CreateWorkRequests < ActiveRecord::Migration
  def change
    create_table :work_requests do |t|
      t.string :name
      t.string :company
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
