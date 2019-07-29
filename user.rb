class User < ApplicationRecord
  
  has_many :notifications, foreign_key: :recipient_id

end
