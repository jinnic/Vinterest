class VideosController < ApplicationController
  # before_action :set_video, only: [:show, :like, :repost, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:show, :index]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  #
  # GET /videos
  def index
    @videos = Video.all
  end

  # GET /videos/1
  def  show
    @video = Video.find(params[:id])

  end

  # GET /videos/new
  def new
    @users = User.all
    @video = Video.new
    @boards = Board.all
  end

  # GET /videos/1/edit
  def  edit
    @users = User.all
    @boards = Board.all
    @video = Video.find(params[:id])

  end

  # POST /videos
  def create
 

    # @user = current_user
    # video = @user.videos.build(video_params(:description))
    # @video = current_user.videos.build(video_params)
    
    video = Video.create(video_params)
    # respond_to do |format|
    #   if @video.save
    #     format.html { redirect_to videos_path, notice: 'Video was successfully created.' }
    #     format.json { render :show, status: :created, location: @video }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @video.errors, status: :unprocessable_entity }
    #   end
    # end
    
    redirect_to board_path(video.board_id) 
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    video = Video.find(params[:id])
    video.update(video_params)
    redirect_to board_path(video.board_id)
  end

  # DELETE /videos/1
  def  destroy
    video = Video.find(params[:id])
    video.destroy
    redirect_to board_path(video.board_id) 
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:description, :video_file_name, :board_id, :user_id, :video_src)
    end

end
