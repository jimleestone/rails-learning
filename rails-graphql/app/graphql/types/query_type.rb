module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: false do
      description 'ユーザ情報を1件取得する'
      argument :id, Int, required: true, description: 'ユーザID'
    end
    def user(id:)
      User.find(id)
    end

    field :users, [Types::UserType], null: false, description: 'ユーザ情報を全件取得する'
    def users
      User.all
    end

    field :posts, [Types::PostType], null: false, description: 'Fetch all posts'
    def posts
      Post.all
    end
  end
end
