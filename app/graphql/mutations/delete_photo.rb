# frozen_string_literal: true

module Mutations
  class DeletePhoto < BaseMutation
    argument :id, ID, required: true

    field :photo, Types::PhotoType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      user = context[:current_user]
      return { photo: nil, errors: ['Not authenticated'] } unless user

      photo = user.photos.find_by(id: id)

      if photo
        if photo.destroy
          { photo: photo, errors: [] }
        else
          { photo: nil, errors: photo.errors.full_messages }
        end
      else
        { photo: nil, errors: ['Photo not found or does not belong to user'] }
      end
    rescue => e
      { photo: nil, errors: [e.message] }
    end
  end
end
