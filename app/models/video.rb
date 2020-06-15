class Video < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def src_modify(src)
    # byebug
    src = VideoEmbedUrlGenerator.new(src)
  end
end
