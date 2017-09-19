require 'bcrypt'

class User < ActiveRecord::Base
    has_many :user_roles
    validates :login, presence: true, length: { minimum: 3 }
    #validates :password, presence: true, length: { minimum: 3 }
    has_secure_password
end
