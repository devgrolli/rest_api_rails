# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    puts 'Resetando o banco de dados...'
    `rails db:drop db:create db:migrate`

    puts '- Cadastrando tipos de contatos'
    kinds = %w[Amigo Comercial Conhecido]
    kinds.each do |kind|
      Kind.create!(description: kind)
    end

    puts '- Cadastrando contatos'
    100.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts '- Cadastrando telefones'
    Contact.all.each do |contact|
      Random.rand(5).times do |_i|
        contact.phones << Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.save!
      end
    end

    puts '- Cadastrando endereços'
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        contact: contact
      )
    end
  end
end
