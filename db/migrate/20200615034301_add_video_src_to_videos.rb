class AddVideoSrcToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :video_src, :string
  end
end
