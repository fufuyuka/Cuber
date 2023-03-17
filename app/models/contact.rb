class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true
  validates :contact_detail, presence: true, length: { maximum: 800 }
  validates :memo, length: { maximum: 1000 }
end
