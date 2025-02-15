class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :contents, null: false
      t.string :video_url, null: false

      t.timestamps
    end
  end
end
