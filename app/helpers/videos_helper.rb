module VideosHelper
  def construct_yt_url(video_id)
    "https://www.youtube.com/embed/#{video_id}"
  end

  def construct_video_iframe(width="640",height="480", video_id)
    '<iframe '\
      'class="embed-responsive-item"'\
      "width=#{width.to_s} "\
      "height=#{height.to_s}"\
      'allow="autoplay; fullscreen" '\
      'allowfullscreen, '\
      "src='#{construct_yt_url(video_id)}'>"\
    '</iframe>'
  end
end
