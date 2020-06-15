class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    @users = User.all
    # @board = @board.board.build
  end

  def create
    # board = @board.boards.build(board_params(:description))
    board = Board.create(board_params(:name, :user_id))
    redirect_to board_path(board)
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    # byebug
    board = Board.find(params[:id])
    board.update(board_params(:name, :user_id))

    redirect_to board_path(board)
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    redirect_to boards_path
  end

  private

  def board_params(*arg)
    params.require(:board).permit(arg)
  end
end
