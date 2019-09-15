class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :text, :limit => 160

      t.timestamps
    end
  end
end
