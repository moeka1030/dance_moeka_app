class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :contents, presence: true, length: { maximum:200 }
  # validates :video_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
