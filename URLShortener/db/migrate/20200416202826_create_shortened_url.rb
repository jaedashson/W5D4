class CreateShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      # Can any of the URLs be null?
      # Which ones should be unique?
      t.string :long_url, null: false
      t.string :short_url, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    
    # Which URL should we index?
    add_index :shortened_urls, :user_id
    add_index :shortened_urls, :short_url, unique: true
    add_index :users, :email, unique: true
  end
end
