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

user1 = User.create(username: 'hyojin', email: 'abc@gmail.com', password: '1234', profile: 'hi i\'m the user1')  
user2 = User.create(username: 'nupur', email: 'def@gmail.com',password: '1234', profile: 'hi i\'m the user2')  

board1 = Board.create(name: 'sports', user_id: user1.id, public: false)
board2 = Board.create(name: 'art', user_id: user1.id, public: true)

Video.create(description: 'video 01', video_file_name: "one video", user_id: user1.id, board_id: board1.id, video_src: 'https://www.youtube.com/watch?v=InwElkElilk')
Video.create(description: 'video 01', video_file_name: "one video", user_id: user1.id, board_id: board1.id, video_src: 'https://www.youtube.com/watch?v=InwElkElilk')
Video.create(description: 'video 01', video_file_name: "one video", user_id: user1.id, board_id: board1.id, video_src: 'https://www.youtube.com/watch?v=InwElkElilk')

Video.create(description: 'sasdfsda', video_file_name: "Brilliant craft", user_id: user1.id, board_id: board2.id, video_src: 'https://www.youtube.com/watch?v=SY9xMfMd01I')
Video.create(description: 'After the outbreak of COVID-19 and the beginnings of global lockdown, we sent out a call to animators from around the world to send us a short animation depicting something they have experienced during the pandemic.', video_file_name: "#FlattenTheCurve - 2/3", user_id: user1.id, board_id: board2.id, video_src: 'https://vimeo.com/420963458')
Video.create(description: "Art school was too expensive so Lauren Brevner taught herself. Then the Vancouver based mixed-media artist made a lane for herself using social media.   »Subscribe to CBC Arts to watch more videos: http://bit.ly/CBCArtsSubscribe  For Vancouver artist Lauren Brevner, Instagram actually changed her life. In this video, Brevner lets us into her Vancouver studio as she puts the finishing touches on her latest works. She tells us about the Japanese designer who changed her life, and how she got her art out into the world.  Follow Lauren Brevner on Instagram: https://www.instagram.com/laurenbrevn...  Find us at http://bit.ly/CBCArtsWeb CBC Arts on Facebook: http://bit.ly/CBCArtsFacebook CBC Arts on Twitter: http://bit.ly/CBCArtsTwitter CBC Arts on Instagram: http://bit.ly/CBCArtsInstagram  About: CBC Arts is your destination for extraordinary Canadian arts. Whether you're a culture vulture, a working artist, an avid crafter, a compulsive doodler or just a dabbler in the arts, there's something for you here.  Instagram Changed This Artist's Life https://www.youtube.com/CBCArts", video_file_name: "Instagram Changed This Artist's Life", user_id: user1.id, board_id: board2.id, video_src: 'https://www.youtube.com/watch?v=R5qs03hojxI&list=RDzbh7tAnwLCY&index=3')
Video.create(description: 'From Bergdorf Goodman and Givenchy to Sotheby’s — and across much of the internet — artist Benjamin Shine’s ethereal work with tulle has made him perhaps the foremost fabric sculptor in practice today. We met with Shine in his studio to see, and try to understand, his process.', video_file_name: "This Artist Makes Incredible Sculptures Out of Fabric", user_id: user1.id, board_id: board2.id, video_src: 'https://www.youtube.com/watch?v=fLLOlB2WF_Y&list=RDzbh7tAnwLCY&index=2')
Video.create(description: 'sasdfsda', video_file_name: "Brilliant craft", user_id: user1.id, board_id: board2.id, video_src: 'https://www.youtube.com/watch?v=SY9xMfMd01I')
Video.create(description: "Artist Refik Anadol doesn't work with paintbrushes or clay. Instead, he uses large collections of ", video_file_name: "How This Guy Uses A.I. to Create Art | Obsessed | WIRED", user_id: user1.id, board_id: board2.id, video_src: 'https://www.youtube.com/watch?v=I-EIVlHvHRM&t=168s')
Video.create(description: "Art school was too expensive so Lauren Brevner taught herself. Then the Vancouver based mixed-media artist made a lane for herself using social media.   »Subscribe to CBC Arts to watch more videos: http://bit.ly/CBCArtsSubscribe  For Vancouver artist Lauren Brevner, Instagram actually changed her life. In this video, Brevner lets us into her Vancouver studio as she puts the finishing touches on her latest works. She tells us about the Japanese designer who changed her life, and how she got her art out into the world.  Follow Lauren Brevner on Instagram: https://www.instagram.com/laurenbrevn...  Find us at http://bit.ly/CBCArtsWeb CBC Arts on Facebook: http://bit.ly/CBCArtsFacebook CBC Arts on Twitter: http://bit.ly/CBCArtsTwitter CBC Arts on Instagram: http://bit.ly/CBCArtsInstagram  About: CBC Arts is your destination for extraordinary Canadian arts. Whether you're a culture vulture, a working artist, an avid crafter, a compulsive doodler or just a dabbler in the arts, there's something for you here.  Instagram Changed This Artist's Life https://www.youtube.com/CBCArts", video_file_name: "Instagram Changed This Artist's Life", user_id: user1.id, board_id: board2.id, video_src: 'https://www.youtube.com/watch?v=R5qs03hojxI&list=RDzbh7tAnwLCY&index=3')
Video.create(description: 
        'Melissa McCracken thought everyone associated colors with music the same way she did. But she soon realized that her senses were unique. The Kansas City-based artist is a synesthete, and she is able to translate sound into vivid paintings. Talk about seeing the world in a different light.', 
        video_file_name: "The Artist Who Paints What She Hears", 
        user_id: user1.id, board_id: board2.id, video_src: 'https://www.youtube.com/watch?v=zbh7tAnwLCY')