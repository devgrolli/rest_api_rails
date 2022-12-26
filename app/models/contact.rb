class Contact < ApplicationRecord
  belongs_to :kind

  def author
    Faker::Name.name
  end

  def kind_description
    # pega a descrição do titulo do contato atual
    self.kind.description
  end

  def as_json(options={})
    #redefinindo o as_json de todos os metodos HTTP
    super(
      methods: [:author, :kind_description],
      root: true,
      include: { 
        kind: { only: :description } 
      }
    )
  end
end
