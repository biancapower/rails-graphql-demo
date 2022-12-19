class Types::AuthorType < Types::BaseObject
  description "An author of a book"
  field :id, ID, null: false
  field :first_name, String, null: false
  field :last_name, String, null: false
  field :yob, Integer, null: false
  field :is_alive, Boolean, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :full_name, String, null: false

  field :backwards_name, String, null: false, description: "The author's name, written backwards"
  def backwards_name
    "#{object.last_name}, #{object.first_name}"
  end

  field :coordinates, Types::CoordinatesType, null: false
end

# AuthorInputType
class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name "AuthorInputType"

  description "Properties for creating an author"
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :yob, Integer, required: true
  argument :is_alive, Boolean, required: true
end
