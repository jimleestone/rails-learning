module Types
  class PostType < Types::BaseObject
    field :id, Int, null: false
    field :user, Types::UserType, null: false
    field :subject, String, null: false
    field :body, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :comments, [Types::CommentType], null: false
  end
end
