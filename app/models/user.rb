class User < ApplicationRecord
  has_many :videos, dependent: :destroy 
  has_many :boards, dependent: :destroy 

  # def user_signed_in?
  #   self.
  # end
end
