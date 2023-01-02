# frozen_string_literal: true

class Contact < ApplicationRecord
  # associações
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def author
  #   Faker::Name.name
  # end

  # def kind_description
  #   # pega a descrição do titulo do contato atual
  #   self.kind.description
  # end

  # def as_json(options={})
  #   #redefinindo o as_json de todos os metodos HTTP
  #   super(
  #     methods: [:author, :kind_description],
  #     root: true,
  #     include: {
  #       kind: { only: :description }
  #     }
  #   )
  # end
end
