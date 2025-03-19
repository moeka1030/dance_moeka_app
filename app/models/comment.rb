# commentに関して口数が足りなく、未実装
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
