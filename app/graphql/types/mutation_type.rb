module Types
  class MutationType < Types::BaseObject
    # create author
    field :create_author, Types::AuthorType, null: false, mutation: Mutations::CreateAuthor
  end
end
