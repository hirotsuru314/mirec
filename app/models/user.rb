class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    username = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]
    
    User.find_or_create_by(uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.username = username
      user.image_url = image_url
     end
  end
end
