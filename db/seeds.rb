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
