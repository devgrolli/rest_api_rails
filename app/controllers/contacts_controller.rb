class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all

    # render json pega o objeto, transforma em json e dps transforma em texto assim - @contacts.as_json.to_json
    # only: [:name, :email] - Somente os campos
    # except: Não retorna tal campo
    # Render por maps - render json: @contacts.map { |contact| contact.attributes.merge({ author: Faker::Name.name })}

    render json: @contacts, status: :partial_content, methods: :author
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birthdate)
    end
end
