class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :created_at
end
