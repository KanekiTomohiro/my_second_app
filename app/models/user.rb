class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :validatable
	
	has_many :notes

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	  # 以下にset_imageメソッドを定義してください
	  def set_image(file)
	  	#fileが空でなかったら
	    if !file.nil?
	      #URLを取得
	      file_name = file.original_filename
	      # public/user_imageにurlを保存
	      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
	      # @userのimageセッターを使って、file_nameをセット
	      self.image = file_name
	    end
	  end

end
