# ユーザーデータの作成

puts "Userデータ作成開始"
user1 = User.find_or_create_by!(email: "moeka@example.com") do |u|
  u.name = "Moeka"
  u.password = "password123"
  u.password_confirmation = "password123"
  u.genre = "HIPHOP"
  u.age = 20
  u.experience = 10
end

user2 = User.find_or_create_by!(email: "ken@example.com") do |u|
  u.name = "Ken"
  u.password = "password456"
  u.password_confirmation = "password456"
  u.genre = "HIPHOP"
  u.age = 40
  u.experience = 10
end


# 投稿のダミーデータ

puts "Postデータ作成開始"
post1 = Post.create!(
  user: user1,
  genre: "HIPHOP",
  description: "ダンスが好き！"
)
post2 = Post.create!(
  user: user2,
  genre: "HIPHOP",
  description: "ストリートダンス最高！"
)


# いいねのダミーデータ

puts "Likeデータ作成開始"
Like.create!(
  user: user1,
  post: post2 # Moeka が Ken の投稿にいいね！
)
Like.create!(
  user: user2,
  post: post1 # Ken が Moeka の投稿にいいね！
)




# ActiveStorage の画像を設定（すでに設定済みならスキップ）
[user1, user2].each do |user|
  unless user.profile_image.attached?
    image_path = Rails.root.join("public/default-profile.png")

    if File.exist?(image_path)
      user.profile_image.attach(
        io: File.open(image_path),
        filename: "default-profile.png",
        content_type: "image/png"
      )
      puts "✅ #{user.name} のプロフィール画像をアタッチしました！"
    else
      puts "⚠️ 画像ファイルが見つかりません！ #{image_path}"
    end
  else
    puts "✅ #{user.name} のプロフィール画像はすでに設定されています！"
  end
end
