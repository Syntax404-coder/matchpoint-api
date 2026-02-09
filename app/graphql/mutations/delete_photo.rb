# frozen_string_literal: true

module Mutations
  class DeletePhoto < BaseMutation
    argument :photo_id, ID, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(photo_id:)
      user = context[:current_user]
      return { user: nil, errors: ['Not authenticated'] } unless user

      photo = user.photos.find_by(id: photo_id)
      return { user: nil, errors: ['Photo not found'] } unless photo

      if photo.destroy
        { user: user.reload, errors: [] }
      else
        { user: nil, errors: photo.errors.full_messages }
      end
    end
  end
end
