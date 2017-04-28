class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :notes
  
  devise :database_authenticatable, :registerable, :validatable
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # 画像アップロード用のインスタンスメソッド
  def set_image(file)
    p "aaaaaaaa"
    if !file.nil?
    p "bbbbbbbbbbb"
      file_name = file.original_filename
      p file_name
      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end

end
