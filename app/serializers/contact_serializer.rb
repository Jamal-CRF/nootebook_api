class ContactSerializer < ActiveModel::Serializer

  belongs_to :kind do 
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address
  
  attributes :id, :name, :email, :birthdate #, :author
  attribute :br_date, format: :br_date

  # def author
  #   "Jamal"
  # end
  
  # link(:self) { contact_url(object.id) }
  # link(:kind) { kind_url(object.kind.id) }
  meta do
    {author: "Jamal Jabem"}
  end

  def br_date
    object.birthdate&.strftime("%d/%m/%Y")
  end
end
