class RemoveVideoUrlFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :video_url, :string
  end
end
