class Video < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def src_modify(src)
    # byebug
    src = VideoEmbedUrlGenerator.new(src)
  end

  def time_diffrence(updated_at)
    now = Time.now
    if self.updated_at == nil
      TimeDifference.between(now, self.created_at.time).humanize
    else
      TimeDifference.between(now, self.updated_at.time).humanize
    end
  end
end
