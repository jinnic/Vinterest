class Board < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy 

  def time_diffrence(updated_at)
    now = Time.now
    if self.updated_at == nil
      TimeDifference.between(now, self.created_at.time).humanize
    else
      TimeDifference.between(now, self.updated_at.time).humanize
    end
  end

  
end
