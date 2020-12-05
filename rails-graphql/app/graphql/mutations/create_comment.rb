module Mutations
  class CreateComment < BaseMutation
    argument :user_id, Int, required: true
    argument :post_id, Int, required: true
    argument :body, String, required: true

    field :comment, Types::CommentType, null: true
    field :result, Boolean, null: true

    def resolve(**args)
      comment = Comment.create(user_id: args[:user_id], post_id: args[:post_id], body: args[:body])
      {
        comment: comment,
        result: comment.errors.blank?
      }
    end
  end
end
