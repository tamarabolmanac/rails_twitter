class AddMentionColumnToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :mentions, :integer, :default=> 0
  end
end
