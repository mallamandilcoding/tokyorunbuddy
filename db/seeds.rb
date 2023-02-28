require 'open-uri'

puts "Cleaning database. Removing all existing users and runs..."
Run.destroy_all
User.destroy_all

puts "Creating users..."
User.create!(
  first_name: "Mandil",
  last_name: "Malla",
  email: "mallamandilcoding@gmail.com",
  password: 123123,
  time_of_day_preference: "morning",
  temperature_preference: 15,
)
User.create!(
  first_name: "Emika",
  last_name: "Sangu",
  email: "em888ka@gmail.com",
  password: 123123,
  time_of_day_preference: "afternoon",
  temperature_preference: 20,
)
User.create!(
  first_name: "Kurisu",
  last_name: "Sutairusu",
  email: "sutairusu@me.com",
  password: 123123,
  time_of_day_preference: "evening",
  temperature_preference: 10,
)
User.create!(
  first_name: "John",
  last_name: "Baker",
  email: "john.baker@gmail.com",
  password: 123123,
  time_of_day_preference: "morning",
  temperature_preference: 20,
)
User.create!(
  first_name: "Keina",
  last_name: "Morikawa",
  email: "keina.morikawa@me.com",
  password: 123123,
  time_of_day_preference: "evening",
  temperature_preference: 15,
)

puts "Setting the time zone..."
ENV['TZ'] = 'Asia/Tokyo'

puts "Creating runs..."
runs = [
  { date: Date.new(2023, 3, 3), start_time: Time.new(2023, 3, 3, 20), end_time: Time.new(2023, 3, 3, 22), status: "scheduled", location: "Yamashita Park", description: "Yamashita Park (山下公園, Yamashita Kōen) is a public park that stretches about 750 meters along Yokohama's waterfront. The park is about a hundred meters wide, and consists mostly of open green space. One of the park's main features is a wide path that runs along the water. It is usually quite busy, with many people enjoying the view of the bay and the ships passing by. At the park's southern end, the path leads into the Rinkosen promenade, which passes by the Osanbashi Pier and leads to Minato Mirai. The walk is a pleasant way to travel between the areas.", weather: 15, wind: 25.0, humidity: 10, precipitation: 0.0, air_quality: 1, user: User.first },
  { date: Date.new(2023, 3, 4), start_time: Time.new(2023, 3, 4, 16), end_time: Time.new(2023, 3, 3, 18), status: "scheduled", location: "Yamashita Park", description: "Yamashita Park (山下公園, Yamashita Kōen) is a public park that stretches about 750 meters along Yokohama's waterfront. The park is about a hundred meters wide, and consists mostly of open green space. One of the park's main features is a wide path that runs along the water. It is usually quite busy, with many people enjoying the view of the bay and the ships passing by. At the park's southern end, the path leads into the Rinkosen promenade, which passes by the Osanbashi Pier and leads to Minato Mirai. The walk is a pleasant way to travel between the areas.", weather: 18, wind: 20.0, humidity: 10, precipitation: 0.0, air_quality: 1, user: User.first },
  { date: Date.new(2023, 3, 5), start_time: Time.new(2023, 3, 5, 16), end_time: Time.new(2023, 3, 5, 18), status: "suggested", location: "Imperial Palace Course", description: "The current Imperial Palace (皇居, Kōkyo) is located on the former site of Edo Castle, a large park area surrounded by moats and massive stone walls in the center of Tokyo, a short walk from Tokyo Station. The palace lies at the heart of Tokyo. The 5 km circuit around the palace is extremely popular among runners, and many races have been held there over the years.", weather: 17, wind: 18.0, humidity: 8, precipitation: 0.0, air_quality: 1, user: User.first },
  { date: Date.new(2023, 3, 5), start_time: Time.new(2023, 3, 5, 12), end_time: Time.new(2023, 3, 5, 14), status: "suggested", location: "Tama River Trail", description: "The Tama River (多摩川, Tamagawa) trail is one of the best ways to go on a long, uninterrupted run in Tokyo. This trail is also popular with cyclists. One can run all the way from Fussa station line in the north, heading south toward the sea. The paved path parallels the river most of the way, slightly above the river. There are some sections where a gravel trail runs level with the river, and some sections where there is a path on both sides of the river.", weather: 16, wind: 10.0, humidity: 5, precipitation: 0.0, air_quality: 1, user: User.first },
  { date: Date.new(2023, 3, 6), start_time: Time.new(2023, 3, 6, 19), end_time: Time.new(2023, 3, 6, 21), status: "suggested", location: "Yamashita Park", description: "Yamashita Park (山下公園, Yamashita Kōen) is a public park that stretches about 750 meters along Yokohama's waterfront. The park is about a hundred meters wide, and consists mostly of open green space. One of the park's main features is a wide path that runs along the water. It is usually quite busy, with many people enjoying the view of the bay and the ships passing by. At the park's southern end, the path leads into the Rinkosen promenade, which passes by the Osanbashi Pier and leads to Minato Mirai. The walk is a pleasant way to travel between the areas.", weather: 15, wind: 25.0, humidity: 10, precipitation: 0.0, air_quality: 1, user: User.first },
  { date: Date.new(2023, 2, 26), start_time: Time.new(2023, 2, 26, 16), end_time: Time.new(2023, 2, 26, 18), status: "completed", location: "Yamashita Park", description: "Yamashita Park (山下公園, Yamashita Kōen) is a public park that stretches about 750 meters along Yokohama's waterfront. The park is about a hundred meters wide, and consists mostly of open green space. One of the park's main features is a wide path that runs along the water. It is usually quite busy, with many people enjoying the view of the bay and the ships passing by. At the park's southern end, the path leads into the Rinkosen promenade, which passes by the Osanbashi Pier and leads to Minato Mirai. The walk is a pleasant way to travel between the areas.", weather: 15, wind: 25.0, humidity: 10, precipitation: 0.0, air_quality: 1, user: User.first }
]

location_images = [
  ["app/assets/images/yamashita1.jpeg", "app/assets/images/yamashita2.jpeg", "app/assets/images/yamashita3.jpeg"],
  ["app/assets/images/yamashita1.jpeg", "app/assets/images/yamashita2.jpeg", "app/assets/images/yamashita3.jpeg"],
  ["app/assets/images/palace1.jpeg", "app/assets/images/palace2.jpeg", "app/assets/images/palace3.jpeg"],
  ["app/assets/images/tama1.jpeg", "app/assets/images/tama2.jpeg", "app/assets/images/tama3.jpeg"],
  ["app/assets/images/yamashita1.jpeg", "app/assets/images/yamashita2.jpeg", "app/assets/images/yamashita3.jpeg"],
  ["app/assets/images/yamashita1.jpeg", "app/assets/images/yamashita2.jpeg", "app/assets/images/yamashita3.jpeg"]
]

runs.each_with_index do |run, index|
  r = Run.new(run)
  file_paths = location_images[index]
  file_paths.each do |file_path|
    file = File.open(file_path)
    r.photos.attach(io: file, filename: "#{r.location}.jpeg")
  end
  r.save!
end

puts "Finished!"
