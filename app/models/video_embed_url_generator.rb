class VideoEmbedUrlGenerator
  REGEX_ID = %r{(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/|vimeo\.com\/)([a-zA-Z0-9_-]{8,11})}.freeze
  REGEX_PROVIDER = /(youtube|youtu\.be|vimeo)/.freeze

  def initialize(url)
    @url  =  url
  end

  def  construct_iframe(width="640",height="480")
    '<iframe '\
      'class="embed-responsive-item"'\
      "width=#{width.to_s} "\
      "height=#{height.to_s}"\
      'allow="autoplay; fullscreen" '\
      'allowfullscreen, '\
      "src='#{construct_url}'>"\
    '</iframe>'
  end
  
  def  construct_video(width="100%")
    '<video controls '\
      "src='#{construct_url} '" \
      "width='#{width.to_s}>'"
  end

  def  construct_url
    case video_provider
    when :youtube
      "https://www.youtube.com/embed/#{video_id}"
    when :vimeo
      "https://player.vimeo.com/video/#{video_id}"
    end
  end

  private

  attr_accessor :url

  def video_provider
    case matched_result(REGEX_PROVIDER)
    when 'youtube', 'youtu.be'
      :youtube
    when 'vimeo'
      :vimeo
    end
  end

  def video_id
    matched_result(REGEX_ID)
  end

  def matched_result(regex)
    match = regex.match(url)
    return if match.blank? || match[1].blank?

    match[1]
  end
end