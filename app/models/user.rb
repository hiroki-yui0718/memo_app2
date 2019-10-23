class User < ApplicationRecord
    has_many :memos
    has_secure_password
    def self.find_or_create_from_auth_hash(auth_hash)
        provider = auth_hash[:provider]
        uid = auth_hash[:uid]
        name = auth_hash[:info][:nickname]
        image = auth_hash[:info][:image]

    User.find_or_create_by(provider: provider,uid: uid) do |user|
        user.name =name
        user.image= image
    end
end
end
