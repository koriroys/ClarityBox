class ChangeAppRequestMessageStringToText < ActiveRecord::Migration
  def change
    change_column :app_requests, :message, :text
  end
end
