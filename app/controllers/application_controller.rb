class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) << :name
  # end

  #rails 5.0.0以降はforメソッドが使えないらしいからpermitメソッドに変更
  #参考サイト　http://qiita.com/karunru/items/2d8e11556213d536f7df

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
