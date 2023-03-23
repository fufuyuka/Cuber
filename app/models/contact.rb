class Contact < ApplicationRecord
  
  enum supported_status: { not_supported: 0, support_now: 1, finish_suppport: 2 }
  
  validates :name, presence: true, length: { in:1..20 }
  validates :email, presence: true
  validates :contact_detail, presence: true, length: { in:1..800 }
  validates :memo, length: { maximum: 1000 }
end
