namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones << Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.save!
      end
    end

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(description: kind)
    end

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
  end
end
