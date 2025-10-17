class BuyerProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :profile_picture

  def profile_picture
    if object.profile_picture.attached?
      rails_blob_url(object.profile_picture, only_path: true)
    end
  end
end
