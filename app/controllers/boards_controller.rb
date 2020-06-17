class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    # @board = @board.board.build
  end

  def create
    @user = current_user
    # byebug
    board = @user.boards.build(board_params)
    board.save
    redirect_to board_path(board)
  end

  def show
    @board = Board.find(params[:id])
    if !@board.public && !current_user 
       redirect_to_back_or_default
    end
  end

  def edit
    @board = Board.find(params[:id])
    respond_to do |format|
      format.js 
      format.html
    end
  end

  def update
    # byebug
    board = Board.find(params[:id])
    board.update(board_params)

    redirect_to board_path(board)
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :user_id, :public)
  end

  def redirect_to_back_or_default(default = root_url)
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_back fallback_location: default
    else
      redirect_to default
    end
  end

end
