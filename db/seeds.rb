# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all
Board.destroy_all
Video.destroy_all 

user1 = User.create(email: 'abc@gmail.com', password: '1234', profile: 'hi i\'m the user1')  
user2 = User.create(email: 'def@gmail.com', password: '1234', profile: 'hi i\'m the user2')  

board1 = Board.create(name: 'sports', user_id: user1.id)
board2 = Board.create(name: 'art', user_id: user1.id)

video1 = Video.create(description: 'video 01', video_file_name: "one video", user_id: user1.id, board_id: board1.id, video_src: 'https://www.youtube.com/watch?v=InwElkElilk')

