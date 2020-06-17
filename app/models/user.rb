class User < ApplicationRecord
  has_secure_password
  has_many :videos, dependent: :destroy 
  has_many :boards, dependent: :destroy 

  def public_board_count(user_id)
    Board.where(user_id: user_id).where("public == true").count
  end

  def private_board_count(user_id)
    Board.where(user_id: user_id).where("public == false").count
  end

end
