module Types
  class PhotoType < Types::BaseObject
    # Fields for Photo Type
    field :id, ID, null: false
    field :url, String, null: false
    field :position, Integer, null: false
    field :is_primary, Boolean, null: false

    def url
      return unless object.image.attached?
      
      # For Cloudinary, get the direct URL from the blob's key
      if Rails.application.config.active_storage.service == :cloudinary
        # Cloudinary stores the public_id in the blob's key
        Cloudinary::Utils.cloudinary_url(object.image.key)
      else
        # Fallback for local storage (development)
        Rails.application.routes.url_helpers.url_for(object.image)
      end
    end
  end
end