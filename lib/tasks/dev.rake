namespace :dev do
  desc "Setup development environment"
  task setup: :environment do
    puts "Creating database..."
    %x(rails db:drop db:create db:migrate)
    puts "Creating 5 kinds..."
    5.times do |i|
      Kind.create!(
        description: Faker::Company.industry
      )
    end

    puts "Kinds created!"

    puts "Creating 100 contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end

    puts "Contacts created!"

    puts "Creating 5 phones for each contact..."
    Contact.all.each do |contact|
      5.times do |i|
        Phone.create!(
          number: Faker::PhoneNumber.cell_phone,
          contact: contact
        )
      end
    end

    puts "Phones created!"
  
    puts "Creating 100 addresses..."
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        contact: contact
      )
    end
  end

end
