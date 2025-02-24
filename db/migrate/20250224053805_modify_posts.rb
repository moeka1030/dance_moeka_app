class ModifyPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :contents, :description
    add_column :posts, :genre, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

  end
end
