module UsersHelper

  def image_for(user)
    if user.image
      #アップロードした画像
      image_tag "/user_images/#{user.image}", class: "profile_img"
    else
      #デフォルト画像
      image_tag "sample.png", class: "profile_img" 
    end
  end

end
