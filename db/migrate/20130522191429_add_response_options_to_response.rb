class AddResponseOptionsToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :yes_response, :boolean
    add_column :responses, :public_response, :boolean, :default => true

  end
end
