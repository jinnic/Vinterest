class Video < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def src_modify(src)
    # byebug
    src = VideoEmbedUrlGenerator.new(src)
  end

  def construct_url(video_id)
    "https://www.youtube.com/embed/#{video_id}"
  end

  def construct_iframe(width="640",height="480")
    '<iframe '\
      'class="embed-responsive-item"'\
      "width=#{width.to_s} "\
      "height=#{height.to_s}"\
      'allow="autoplay; fullscreen" '\
      'allowfullscreen, '\
      "src='#{construct_url}'>"\
    '</iframe>'
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
