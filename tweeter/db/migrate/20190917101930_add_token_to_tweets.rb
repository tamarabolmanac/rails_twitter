class AddTokenToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :token, :string
  end
end
