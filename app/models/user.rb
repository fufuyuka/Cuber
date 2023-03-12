class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum user_status: { active: 0, withdrawal: 1, ban: 2 }
  #user_statusが有効の場合のみログインできる(controllerですり抜けた場合や複数ブラウザでしようとしたとき)
  def active_for_authentication?
    super && (user_status == "active" )
  end

  has_one_attached :profile_image
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'user_default.jpg'
  end

end
