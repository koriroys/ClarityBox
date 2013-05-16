class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.text :response_text
      t.integer :question_id

      t.timestamps
    end
  end
end
