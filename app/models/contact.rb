class Contact < ApplicationRecord
  #associações
  belongs_to :kind, optional: true
  has_many :phones
  accepts_nested_attributes_for :phones

  def as_json(options={})
    #redefinindo o as_json de todos os metodos HTTP
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

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
