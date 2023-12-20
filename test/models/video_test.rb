require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not have video without title" do 
    video = Video.new
    assert_not video.save "Saved the video without a title"
  end 
end
