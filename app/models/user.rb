class User < ApplicationRecord
    belongs_to :organization
    has_many :shifts

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
    
    has_secure_password
end
