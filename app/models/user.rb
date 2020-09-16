class User < ApplicationRecord
  has_secure_password
  has_many :videos, dependent: :destroy 
  has_many :boards, dependent: :destroy 

  def public_board_count(user_id)
    # count = Board.where(user_id: user_id).where("public == true").count
    if Board.where(user_id: user_id).size != 0
      Board.where(user_id: user_id).where("public == true").count
    else
      0
    end
  end

  def private_board_count(user_id)
    # Board.where(user_id: user_id).where("public == false").count
    if Board.where(user_id: user_id).size != 0
      Board.where(user_id: user_id).where("public == false").count
    else
      # byebug
      0
    end
  end

end
