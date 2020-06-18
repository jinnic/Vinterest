class ApiYoutube 
  require 'net/http'
  require 'open-uri'
  require 'json'

  # yt_hash["items"][0]["id"]["videoId"]
  # yt_json = self.get_videos(query)
  URL = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=15&q="
  TOKEN = 
  VIDEO_ONLY = "&type=video&videoEmbeddable=true"


  def initialize(query)
    @query  =  query
    @json = {}
  end

  def get_json
    query = @query
    url = URL+query+VIDEO_ONLY+TOKEN
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
    yt_json = JSON.parse(response.body)
    @json = yt_json
  end


  def videoId(hash)
    hash["items"].collect do |yt|
      yt["id"]["videoId"]
    end
  end

  def videoInfo(hash)
    info = {} 
    hash["items"].collect do |yt|
      info[:title] = yt["snippet"]["title"]
      info[:description] = yt["snippet"]["description"]
    end
    info
  end

  def videoImage(hash)
    images = {} 
    hash["items"].collect do |yt|
      images[:thumbnails] = yt["snippet"]["thumbnails"]["medium"]["url"]
    end
    images
  end

  def video
    hash = get_json
    video = [] 
    # count = 0
    hash["items"].collect do |yt|
      info = {}
      
      info[:videoId] = yt["id"]["videoId"]
      info[:title] = yt["snippet"]["title"]
      info[:description] = yt["snippet"]["description"]
      info[:thumbnails_url] = yt["snippet"]["thumbnails"]["medium"]["url"]

      video << info
      # count += 1
    end
    video
  end
end
