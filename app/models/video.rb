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
  

  def self.all_videos
    videos = Video.all
    @videos = []
    videos.each do |video|
      if video.board.public
        @videos << video
      end
    end
    @videos
    # byebug
  end
end
