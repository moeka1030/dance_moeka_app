# ダミーデータの作成
#ユーザデータ
#
puts "🚀 Userデータ作成開始！"

user1 = User.create!(
  name: "Moeka",
  email: "moeka@example.com",
  password: "password123", 
  password_confirmation: "password123", 
  genre: "HIPHOP",
  age: 20,
  experience: 10,
  profile_image: "default-profile.png"
)
puts "✅ User1 作成完了: #{user1.inspect}"


user2 = User.create!(
  name: "Kei",
  email: "kei@example.com",
  password: "password123", 
  password_confirmation: "password123", 
  genre: "BREAKIN'",
  age: 25,
  experience: 12,
  profile_image: "default-profile.png"
)



# 投稿データ
post1  = Post.create!(
  user: user1,
  content: "ダンス動画をアップしました！",
  video_url: "https://example.com/video1.mp4"
)

post2 = Post.create!(
  user: user2,
  content: "新しいムーブを練習中！",
  video_url: "https://example.com/video2.mp4"
)

# いいねデータ
Like.create!(user: user1, post: post2) # MoekaがKeiの投稿にいいね
Like.create!(user: user2, post: post1)  # KeiがMoekaの投稿にいいね