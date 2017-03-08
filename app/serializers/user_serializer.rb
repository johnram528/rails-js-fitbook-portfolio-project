class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email, :url

  def url
    user_routines_path(object)
  end
end
