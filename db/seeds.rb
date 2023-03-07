require 'open-uri'

puts "Cleaning database. Removing all existing runs, locations and users..."
Run.destroy_all
Location.destroy_all
User.destroy_all

users = [
  {
    first_name: "Mandil",
    last_name: "Malla",
    email: "mallamandilcoding@gmail.com",
    password: 123123,
    time_of_day_preference: "morning",
    temperature_preference: 15
  },
  {
    first_name: "Emika",
    last_name: "Sangu",
    email: "em888ka@gmail.com",
    password: 123123,
    time_of_day_preference: "afternoon",
    temperature_preference: 20
  },
  {
    first_name: "Kurisu",
    last_name: "Sutairusu",
    email: "sutairusu@me.com",
    password: 123123,
    time_of_day_preference: "evening",
    temperature_preference: 10
  },
  {
    first_name: "John",
    last_name: "Baker",
    email: "john.baker@gmail.com",
    password: 123123,
    time_of_day_preference: "morning",
    temperature_preference: 20
  },
  {
    first_name: "Keina",
    last_name: "Morikawa",
    email: "keina.morikawa@me.com",
    password: 123123,
    time_of_day_preference: "evening",
    temperature_preference: 15
  }
]

user_images = [
  ["app/assets/images/mandil.jpeg"],
  ["app/assets/images/emika.jpeg"],
  ["app/assets/images/kurisu.jpeg"],
  ["app/assets/images/john.jpeg"],
  ["app/assets/images/keina.jpeg"]
]

puts "Creating users..."
users.each_with_index do |user, index|
  u = User.new(user)
  file_paths = user_images[index]
  file_paths.each do |file_path|
    file = File.open(file_path)
    u.photo.attach(io: file, filename: "#{u.first_name}.jpeg")
  end
  u.save!
end

locations = [
  {
    name: "Yamashita Park",
    latitude: 35.2644,
    longitude: 139.3859,
    description: "Yamashita Park (山下公園, Yamashita Kōen) is a public park that stretches about 750 meters along Yokohama's waterfront. The park is about a hundred meters wide, and consists mostly of open green space. One of the park's main features is a wide path that runs along the water. It is usually quite busy, with many people enjoying the view of the bay and the ships passing by. At the park's southern end, the path leads into the Rinkosen promenade, which passes by the Osanbashi Pier and leads to Minato Mirai. The walk is a pleasant way to travel between the areas."
  },
  {
    name: "Imperial Palace Loop",
    latitude: 35.6825,
    longitude: 139.7521,
    description: "The current Imperial Palace (皇居, Kōkyo) is located on the former site of Edo Castle, a large park area surrounded by moats and massive stone walls in the center of Tokyo, a short walk from Tokyo Station. The palace lies at the heart of Tokyo. The 5 km circuit around the palace is extremely popular among runners, and many races have been held there over the years."
  },
  {
    name: "Tamagawa Futako Bridge Park",
    latitude: 35.6146314,
    longitude: 139.5998008,
    description: "Futako-Tamagawa Park (二子玉川公園, Futako-Tamagawa Kōen) beside the Tama River is about an eight-minute walk from the station nearby. The large park is perfect for families with kids or pets. The open banks facing the river are slightly inclined, and it's here that you can get a picturesque view of the sunset over Tokyo on a clear day, you'll be able to see Mt Fuji in the distance. For runners, head for the long running course along the Tama River, which is one of the best ways to go on a long, uninterrupted run in Tokyo."
  },
  {
    name: "Meiji Jingu Gaien Course",
    latitude: 35.674996,
    longitude: 139.720397,
    description: "This route at Meiji Jingu Gaien (明治神宮外苑, Meiji Jingu Gaien) starts near Hirakawacho and takes you down the affluent, landscaped neighborhood of Akasaka, past the grounds of the Akasaka Palace, a majestic Neo-Baroque Western style building originally built for the Crown Prince in 1909, and slightly uphill to the hip and verdant Aoyama Itchome. Stopping here and turning back is a little more than 5 km but going around the Gaien loop adds an extra 1.3 km to your run. At night, enjoy the illumination of the memorial building. This run turns to brilliant yellow, red and orange in the fall."
  },
  {
    name: "Meguro River Run",
    latitude: 35.645192,
    longitude: 139.699694,
    description: "What could be more charming than a 3.5 km stretch (7 km round trip) of river covered with the generous foliage of cherry trees leaning over it? Meguro River is one of Tokyo's celebrated spots during the sakura season. While spring is probably its most breathtaking season, this dedicated pedestrian trail between Ikejiri-Ohashi Station (Den-en Toshi Line) and Meguro Station (served by multiple lines) is still delightful in that off-the-beaten path way all year round. Pass by quiet residential areas, small cafes and restaurants, bridges, parks, temples and museums."
  },
  {
    name: "Odaiba Waterfront Course",
    latitude: 35.6294389,
    longitude: 139.7749812,
    description: "Just across the Rainbow Bridge from central Tokyo is a large artificial island in Tokyo Bay where you can run along the waterfront to take in the expansive views of sea and sky. Odaiba was originally built in the 1850s to fortify the city's defense but later developed into a major leisure area. Beginning at the Marine House, you can get in a 3, 5 or 7 km run. It is best accessed by Daiba Station on the Yurikamome Line."
  },
  {
    name: "Yoyogi Park",
    latitude: 35.6697554,
    longitude: 139.6978232,
    description: "Yoyogi Park is the fifth largest park in Tokyo and is a centrally located green space for a run. There are lovely paths, gardens, and water features in one section of the park, connected by a pedestrian bridge to a section of the park with a stadium, outdoor stage, and other facilities. The Meiji Shrine and grounds are also part of the park but is not appropriate for runners. The paved path is about 1 mile around and the perimeter dirt paths are about 2 miles."
  },
  {
    name: "Komazawa Olympic Park",
    latitude: 35.6264955,
    longitude: 139.6630136,
    description: "Komazawa Olympic Park is an inspiring spot for running. The park has numerous facilities that were used for the 1964 Tokyo Olympics, including a running track. There are numerous paths around the park, including a dedicated jogging/cycling course. A loop around the perimeter is about 3 km, but you could add about 1 km or so on the interior paths."
  },
  {
    name: "Koganei Park",
    latitude: 35.7157463,
    longitude: 139.5123056,
    description: "Koganei Park, in Tokyo's western suburbs, is the city's second largest park. This park is a special treat in the spring, plum trees blossoming in March and a festival in early April celebrating the park's 2,000 cherry trees. There are lovely tree-lined paths, fields, a number of other sports facilities in the park as well, including tennis courts,a small cycling course, and the Edo-Tokyo Open Air Architectural Museum. For runners, there are several marked loops, with one at just over 5k being the longest."
  },
  {
    name: "Sumida River Trail",
    latitude: 35.710293,
    longitude: 139.798185,
    description: "This is a riverside route in the centrally located Asakusa area of Tokyo. A pleasant, flat path runs alongside the west side of the Sumida River, from the Azuma Bridge south to the Sumida River Large Bridge. Distance is 4.4 km one-way. Just north of the Asakusa Station (northern end of path) is the Sensō-ji Temple — Tokyo's oldest temple."
  }
]

location_images = [
  ["app/assets/images/yamashita1.jpeg", "app/assets/images/yamashita2.jpeg", "app/assets/images/yamashita3.jpeg"],
  ["app/assets/images/palace1.jpeg", "app/assets/images/palace2.jpeg", "app/assets/images/palace3.jpeg"],
  ["app/assets/images/tamagawa1.jpeg", "app/assets/images/tamagawa2.jpeg", "app/assets/images/tamagawa3.jpeg"],
  ["app/assets/images/meiji1.jpeg", "app/assets/images/meiji2.jpeg", "app/assets/images/meiji3.jpeg"],
  ["app/assets/images/megurogawa1.jpeg", "app/assets/images/megurogawa2.jpeg", "app/assets/images/megurogawa3.jpeg"],
  ["app/assets/images/odaiba1.jpeg", "app/assets/images/odaiba2.jpeg", "app/assets/images/odaiba3.jpeg"],
  ["app/assets/images/yoyogi1.jpeg", "app/assets/images/yoyogi2.jpeg", "app/assets/images/yoyogi3.jpeg"],
  ["app/assets/images/komazawa1.jpeg", "app/assets/images/komazawa2.jpeg", "app/assets/images/komazawa3.jpeg"],
  ["app/assets/images/koganei1.jpeg", "app/assets/images/koganei2.jpeg", "app/assets/images/koganei3.jpeg"],
  ["app/assets/images/sumidagawa1.jpeg", "app/assets/images/sumidagawa2.jpeg", "app/assets/images/sumidagawa3.jpeg"]
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
  puts "#{l.name} has been created successfully!" # add this line
end

locations = Location.all

runs = [
  {
    start_time: DateTime.new(2023, 3, 12, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 12, 18, 0, 0, '+9'),
    status: "scheduled",
    weather_description: "clear sky",
    wind: 8.0, humidity: 63.0,
    precipitation: 0.0,
    temperature: 10,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 3, 11, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 11, 18, 0, 0, '+9'),
    status: "scheduled",
    weather_description: "clear sky",
    wind: 7.0,
    humidity: 65,
    precipitation: 0.0,
    temperature: 14,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 3, 13, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 13, 18, 0, 0, '+9'),
    status: "suggested",
    weather_description: "clear sky",
    wind: 8.0, humidity: 63.0,
    precipitation: 0.0,
    temperature: 17,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 3, 16, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 16, 18, 0, 0, '+9'),
    status: "suggested",
    weather_description: "clear sky",
    wind: 8.0, humidity: 63.0,
    precipitation: 0.0,
    temperature: 14,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 3, 16, 18, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 16, 20, 0, 0, '+9'),
    status: "suggested",
    weather_description: "clear sky",
    wind: 8.0, humidity: 63.0,
    precipitation: 0.0,
    temperature: 13,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 3, 5, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 5, 18, 0, 0, '+9'),
    status: "completed",
    weather_description: "few clouds: 11-25%",
    wind: 8.0,
    humidity: 67.0,
    precipitation: 0.0,
    temperature: 11,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 3, 5, 12, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 5, 14, 0, 0, '+9'),
    status: "completed",
    weather_description: "scattered clouds: 25-50%",
    wind: 6.0,
    humidity: 69.0,
    precipitation: 0.0,
    temperature: 12,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 3, 6, 19, 0, 0, '+9'),
    end_time: DateTime.new(2023, 3, 6, 21, 0, 0, '+9'),
    status: "completed",
    weather_description: "few clouds: 11-25%",
    wind: 7.0,
    humidity: 64.0,
    precipitation: 0.0,
    temperature: 14,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 2, 26, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 2, 26, 18, 0, 0, '+9'),
    status: "completed",
    weather_description: "scattered clouds: 25-50%",
    wind: 5.0,
    humidity: 66.0,
    precipitation: 0.0,
    temperature: 12,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 2, 25, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 2, 25, 18, 0, 0, '+9'),
    status: "completed",
    weather_description: "few clouds: 11-25%",
    wind: 8.0,
    humidity: 66.0,
    precipitation: 0.0,
    temperature: 10,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 2, 19, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 2, 19, 18, 0, 0, '+9'),
    status: "completed",
    weather_description: "scattered clouds: 25-50%",
    wind: 7.0,
    humidity: 66.0,
    precipitation: 0.0,
    temperature: 14,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 2, 18, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 2, 18, 18, 0, 0, '+9'),
    status: "completed",
    weather_description: "clear sky",
    wind: 5.0,
    humidity: 66.0,
    precipitation: 0.0,
    temperature: 11,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  },
  {
    start_time: DateTime.new(2023, 2, 12, 16, 0, 0, '+9'),
    end_time: DateTime.new(2023, 2, 12, 18, 0, 0, '+9'),
    status: "completed",
    weather_description: "scattered clouds: 25-50%",
    wind: 6.0,
    humidity: 66.0,
    precipitation: 0.0,
    temperature: 9,
    air_quality: 1,
    user: User.second,
    location: locations.sample
  }
]

puts "Creating runs..."
Run.create!(runs)



puts "Finished!"
