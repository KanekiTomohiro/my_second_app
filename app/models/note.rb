class Note < ApplicationRecord

  belongs_to :user

  # 値があるかどうか
  validates :title,  presence: true
  
  # 値があるかどうか、140文字以下か
  validates :content, presence: true, length: {maximum: 140}

  # user_idがあるかどうか
  validates :user_id, presence: true

end
