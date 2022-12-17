module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field that allows a name to be passed in" do
        argument :name, String, required: false
      end
    def test_field(name: 'there')
      "Hello #{name}!"
    end

    # return all authors
    field :authors, [Types::AuthorType], null: false,
      description: "Returns a list of authors in the database"
    def authors
      Author.all
    end

    # return a single author
    field :author, Types::AuthorType, null: false,
      description: "Returns a single author" do
        argument :id, ID, required: true
      end
    def author(id:)
      Author.find(id)
    end
  end
end
