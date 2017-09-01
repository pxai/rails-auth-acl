class User < ActiveRecord::Base
    has_many :roles
    validates :login, presence: true, length: { minimum: 3 }
end
