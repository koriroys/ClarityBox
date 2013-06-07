class CreateAppRequests < ActiveRecord::Migration
  def change
    create_table :app_requests do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :message

      t.timestamps
    end
  end
end
