class User < ApplicationRecord
  has_secure_password
  has_many :videos, dependent: :destroy 
  has_many :boards, dependent: :destroy 


end
