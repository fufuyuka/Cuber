class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: true #空白でない＆一意性
  validates :profiles, length: { maximum: 140 }

  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :post
  has_many :bookmarks, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_one_attached :profile_image
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'user_default.jpg'
    #短辺を基準に100x100にリサイズ後、中心から100x100に切り抜き
    #profile_image.variant( resize: "100x100^", gravity: "center", crop: "100x100+0+0" )
  end
  # has_many_attached :images do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [100, 100]
  # end

  
  enum user_status: { active: 0, withdrawal: 1, ban: 2 }
  #user_statusが有効の場合のみログインできる(controllerですり抜けた場合や複数ブラウザでしようとしたとき)
  def active_for_authentication?
    super && (user_status == "active" )
  end
  
  #ユーザー検索
  def self.looks(search,word)
    if search == "perfect_match"
    @users = User.where(name: word).order(created_at: :desc)
    else
    @users = User.where("name LIKE?","%#{word}%").order(created_at: :desc)
    end
  end
  
  def self.guest
    find_or_create_by!(name: 'ゲストユーザー' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
end
