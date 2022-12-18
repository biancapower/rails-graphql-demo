class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  description "Create a new author"
  field :author, Types::AuthorType, null: true

  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :yob, Integer, required: true
  argument :is_alive, Boolean, required: true

  def resolve(first_name:, last_name:, yob:, is_alive:)
    Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
  end
end

# query to run in GraphiQL:
# mutation {
#   createAuthor(
#     firstName: "Fred",
#     lastName: "Estair",
#     yob: 1989,
#     isAlive:false
#   ) {
#     id
#     fullName
#   }
# }
