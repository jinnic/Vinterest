class VideosController < ApplicationController
  # before_action :set_video, only: [:show, :like, :repost, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:show, :index]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  #
  # GET /videos
  
  @@search_videos = []
  
  def index
   if logged_in?
      @videos = user_video
   else
      @videos = Video.all_videos
   end
  end

  # GET /videos/1
  def  show
    @video = Video.find(params[:id])

  end

  # GET /videos/new
  def new
    # byebug
    @user = current_user
    @boards = @user.boards
    @video = Video.new
  end

  # GET /videos/1/edit
  def  edit
    @user = current_user
    @boards = @user.boards
    @video = Video.find(params[:id])
  end

  # POST /videos
  def create
    # byebug
    @user = current_user
    video = @user.videos.build(video_params)
    video.save

    redirect_to board_path(video.board_id) 
  end


  def update
    video = Video.find(params[:id])
    video.update(video_params)
    redirect_to board_path(video.board_id)
  end

  # DELETE /videos/1
  def  destroy
    # byebug
    video = Video.find(params[:id])
    board = video.board_id
    video.destroy
    
    redirect_to board_path(board) 
  end

  # get /videos/1
  def  delete_img
    # byebug
    video = Video.find(params[:id])
    board = video.board_id
    video.destroy
    
    redirect_to board_path(board) 
  end

  def  show_repost
    @video = Video.find(params[:id])
  end

  def repost
    @video.repost(video_params, current_user)
    redirect_to root_url
  end

  def  like
    @like = @video.likes.build(user_id: current_user.id)
    if @like.save
      flash[:notice] =  "You liked a recording from #{@video.user.username}!"
      redirect_to(videos_path)
    else
      flash[:notice] =  "You have already liked this recording!"
      redirect_to(videos_path)
    end
  end

  def search
    search_videos = get_video(params[:search])
    unless search_videos
      flash[:alert] = 'videos not found'
      return render action: :index
    end
    @search_videos = []
    @@search_videos = []
    count = 0
    search_videos.each do |video|
      
      @@search_videos << {
                          id: "#{count}", description: "#{video[:description]}",
                          video_file_name: "#{video[:title]}", 
                          video_src: "#{(video[:videoId])}"
                        }
      count += 1
    end
    # byebug
    @search_videos = @@search_videos
    # @video = Video.newbyebug
    render template: 'videos/search'
  end

  def search_new
    # byebug
    @s_video = []
    @@search_videos.each do |video|
      # byebug
       if video[:id] == params[:id]
        # byebug
          @s_video = video
       end
    end
    @s_video
    @user = current_user
    @boards = @user.boards
    @video = Video.new
    # byebug
    render template: 'videos/add_new'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:description, :video_file_name, :board_id, :user_id, :video_src, :search)
    end

    def user_video
      @videos = []
      videos = Video.all
      videos.each do |video|
        if video.user.username == current_user.username
          @videos << video
        end
      end
      @videos
    end

    def redirect_to_back_or_default(default = root_url)
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_back fallback_location: default
      else
        redirect_to default
      end
    end

    # API
  
    def search_show
    end
  
    def get_video(query)
      yt_api = ApiYoutube.new(query)
      @video_searches = yt_api.video
    end
  
    def construct_url(video_id)
        "https://www.youtube.com/embed/#{video_id}"
    end
    #construct iframe for each video
    # @video_searches.each do |video|
    #   construct_iframe(construct_url(video[:videoId]))
    #   video.
    # end
end
