class User < ApplicationRecord
    belongs_to :organization, optional: true
    has_many :shifts

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }
    
    has_secure_password
end
