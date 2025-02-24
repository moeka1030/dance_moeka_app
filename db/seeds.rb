# 🚀 ユーザーデータの作成
puts "🚀 Userデータ作成開始！"

user = User.find_or_create_by!(email: "moeka@example.com") do |u|
  u.name = "Moeka"
  u.password = "password123"
  u.password_confirmation = "password123"
  u.genre = "HIPHOP"
  u.age = 20
  u.experience = 10
end

puts "✅ Userデータ作成完了！"

# 📸 ActiveStorage の画像を設定（すでに設定済みならスキップ）
if user.profile_image.attached? == false
  image_path = Rails.root.join("public/default-profile.png")

  if File.exist?(image_path)
    user.profile_image.attach(
      io: File.open(image_path),
      filename: "default-profile.png",
      content_type: "image/png"
    )
    puts "✅ プロフィール画像をアタッチしました！"
  else
    puts "⚠️ 画像ファイルが見つかりません！ #{image_path}"
  end
else
  puts "✅ すでにプロフィール画像が設定されています！"
end
