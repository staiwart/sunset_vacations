User.create!(name:  "Royndar Brúkari",
             email: "roynd@hvar.fo",
             country: "Faroe Islands",
             password:              "L0yniord",
             password_confirmation: "L0yniord")
             
User.create!(name:  "Admin", email: "admin@abdn.ac.uk",
             country: "Scotland", password: "password",
             password_confirmation: "password",
             admin: true)

48.times do |n|
  navn  = "#{Faker::Name.name}"
  kurla = "#{Faker::Internet.email}"
  land = "#{Faker::Address.country}"
  loyniord = "P4ssword"
  User.create!(name: navn, email: kurla,
                country: land, password: loyniord,
                password_confirmation: loyniord)
end