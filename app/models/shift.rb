class Shift < ApplicationRecord
    belongs_to :user

    validates :start, :finish, :user_id, presence: true
end
