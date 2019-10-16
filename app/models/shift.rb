class Shift < ApplicationRecord
    belongs_to :user

    validates :start, :finish, :user_id, presence: true

    def date
        self.start.strftime('%m/%d/%Y')    
    end

    def time(time)
        time.strftime('%I:%M%p')
    end
end
