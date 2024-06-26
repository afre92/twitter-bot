class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :twitter_account, null: false, foreign_key: true
      t.text :body
      t.datetime :publish_at
      t.boolean :published, default: false
      t.integer :frequency, default: 0
      t.string :tweet_id

      t.timestamps
    end
  end
end

# TwitterJob.perform_later(Tweet.last)