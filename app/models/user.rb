class User < ApplicationRecord
    has_many :memos
    has_secure_password
end
