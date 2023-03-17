class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { minimum:2, maximum:20 }
  validates :email, presence: true, uniqueness: true #空白でない＆一意性
  validates :password, length: { minimum: 6 }
  validates :profiles, length: { maximum: 140 }

  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # has_many :favorited_users, through: :favorites, source: :post
  has_many :post_comments, dependent: :destroy

  has_one_attached :profile_image
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'user_default.jpg'
  end
  
  enum user_status: { active: 0, withdrawal: 1, ban: 2 }
  #user_statusが有効の場合のみログインできる(controllerですり抜けた場合や複数ブラウザでしようとしたとき)
  def active_for_authentication?
    super && (user_status == "active" )
  end
  
  #人からもらったいいねの合計
  # def total_favorited
  #   @favorites_count = 0
  #   @posts = @user.posts
  #   @posts.each do |post|
  #     @favorites_count += post.favorites.count
  #   end
  # end
  
  #ユーザー検索
  def self.looks(word)
    @users = User.where("name LIKE?","%#{word}%")
  end
  
  def self.guest
    find_or_create_by!(name: 'ゲストユーザー' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
end
