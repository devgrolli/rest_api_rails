# frozen_string_literal: true

class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id) }
  end

  has_many :phones
  has_one :address

  link(:self) { contact_url(object.id) }

  def attributes(*args)
    change_date = super(*args)
    # change_date[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    change_date[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    change_date
  end
end
