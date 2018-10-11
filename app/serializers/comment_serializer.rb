class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :update_id, :created_at
end
