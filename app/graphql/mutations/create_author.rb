class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  description "Create a new author"
  field :author, Types::AuthorType, null: true

  argument :author, Types::AuthorInputType, required: true

  def resolve(author:)
    Author.create(author.to_h)
  end
end

# graphiql query
# mutation createAuthor($author:AuthorInputType!) {
#   createAuthor(author: $author) {
#     id
#     fullName
#   }
# }
#
# query variables
# {
#   "author": {
#     "firstName": "Bob",
#     "lastName": "Jane",
#     "yob": 1572,
#     "isAlive": false
# 	}
# }
