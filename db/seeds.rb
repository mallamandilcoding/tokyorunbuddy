require 'open-uri'

puts "Cleaning database. Removing all existing runs, locations and users..."
Run.destroy_all
Location.destroy_all
User.destroy_all

puts "Creating users..."
User.create!(
  first_name: "Mandil",
  last_name: "Malla",
  email: "mallamandilcoding@gmail.com",
  password: 123123,
  time_of_day_preference: "morning",
  temperature_preference: 15
)
User.create!(
  first_name: "Emika",
  last_name: "Sangu",
  email: "em888ka@gmail.com",
  password: 123123,
  time_of_day_preference: "afternoon",
  temperature_preference: 20
)
User.create!(
  first_name: "Kurisu",
  last_name: "Sutairusu",
  email: "sutairusu@me.com",
  password: 123123,
  time_of_day_preference: "evening",
  temperature_preference: 10
)
User.create!(
  first_name: "John",
  last_name: "Baker",
  email: "john.baker@gmail.com",
  password: 123123,
  time_of_day_preference: "morning",
  temperature_preference: 20
)
User.create!(
  first_name: "Keina",
  last_name: "Morikawa",
  email: "keina.morikawa@me.com",
  password: 123123,
  time_of_day_preference: "evening",
  temperature_preference: 15
)

locations = [
  { name: "Yamashita Park", latitude: 35.2644, longitude: 139.3859, description: "Yamashita Park (山下公園, Yamashita Kōen) is a public park that stretches about 750 meters along Yokohama's waterfront. The park is about a hundred meters wide, and consists mostly of open green space. One of the park's main features is a wide path that runs along the water. It is usually quite busy, with many people enjoying the view of the bay and the ships passing by. At the park's southern end, the path leads into the Rinkosen promenade, which passes by the Osanbashi Pier and leads to Minato Mirai. The walk is a pleasant way to travel between the areas." },
  { name: "Imperial Palace Course", latitude: 35.6825, longitude: 139.7521, description: "The current Imperial Palace (皇居, Kōkyo) is located on the former site of Edo Castle, a large park area surrounded by moats and massive stone walls in the center of Tokyo, a short walk from Tokyo Station. The palace lies at the heart of Tokyo. The 5 km circuit around the palace is extremely popular among runners, and many races have been held there over the years." },
  { name: "Tamagawa Futako Bridge Park", latitude: 35.6146314, longitude: 139.5998008, description: "Futako-Tamagawa Park (二子玉川公園, Futako-Tamagawa Kōen) beside the Tama River is about an eight-minute walk from the station nearby. The large park is perfect for families with kids or pets. The open banks facing the river are slightly inclined, and it's here that you can get a picturesque view of the sunset over Tokyo on a clear day, you'll be able to see Mt Fuji in the distance. For runners, head for the long running course along the Tama River, which is one of the best ways to go on a long, uninterrupted run in Tokyo." }
]

location_images = [
  ["app/assets/images/yamashita1.jpeg", "app/assets/images/yamashita2.jpeg", "app/assets/images/yamashita3.jpeg"],
  ["app/assets/images/palace1.jpeg", "app/assets/images/palace2.jpeg", "app/assets/images/palace3.jpeg"],
  ["app/assets/images/tamagawa1.jpeg", "app/assets/images/tamagawa2.jpeg", "app/assets/images/tamagawa3.jpeg"]
]

puts "Setting the time zone..."
ENV['TZ'] = 'Asia/Tokyo'

puts "Creating runs..."
runs = [
  { date: Date.new(2023, 3, 3), start_time: Time.new(2023, 3, 3, 20), end_time: Time.new(2023, 3, 3, 22), status: "scheduled", weather: "clear sky", wind: 8.0, humidity: 63.0, precipitation: 0.0, air_quality: 1, user: User.last, location: Location.first },
  { date: Date.new(2023, 3, 4), start_time: Time.new(2023, 3, 4, 16), end_time: Time.new(2023, 3, 3, 18), status: "scheduled", weather: "clear sky", wind: 7.0, humidity: 65, precipitation: 0.0, air_quality: 1, user: User.last, location: Location.first },
  { date: Date.new(2023, 3, 5), start_time: Time.new(2023, 3, 5, 16), end_time: Time.new(2023, 3, 5, 18), status: "suggested", weather: "few clouds: 11-25%", wind: 8.0, humidity: 67.0, precipitation: 0.0, air_quality: 1, user: User.last, location: Location.second },
  { date: Date.new(2023, 3, 5), start_time: Time.new(2023, 3, 5, 12), end_time: Time.new(2023, 3, 5, 14), status: "suggested", weather: "scattered clouds: 25-50%", wind: 6.0, humidity: 69.0, precipitation: 0.0, air_quality: 1, user: User.last, location: Location.second },
  { date: Date.new(2023, 3, 6), start_time: Time.new(2023, 3, 6, 19), end_time: Time.new(2023, 3, 6, 21), status: "suggested", weather: "few clouds: 11-25%", wind: 7.0, humidity: 64.0, precipitation: 0.0, air_quality: 1, user: User.last, location: Location.first },
  { date: Date.new(2023, 2, 26), start_time: Time.new(2023, 2, 26, 16), end_time: Time.new(2023, 2, 26, 18), status: "completed", weather: "scattered clouds: 25-50%", wind: 8.0, humidity: 66.0, precipitation: 0.0, air_quality: 1, user: User.last, location: Location.last }
]

puts "Creating locations..."
locations.each_with_index do |location, index|
  l = Location.new(location)
  file_paths = location_images[index]
  file_paths.each do |file_path|
    file = File.open(file_path)
    l.photos.attach(io: file, filename: "#{l.name}.jpeg")
  end
  l.save!
end

puts "Creating runs..."
Run.create!(runs)

puts "Finished!"
