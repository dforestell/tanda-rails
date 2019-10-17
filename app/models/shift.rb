class Shift < ApplicationRecord
    belongs_to :user

    validates :start, :finish, :user_id, presence: true

    def date
        self.start.strftime('%m/%d/%Y')    
    end

    def time(time)
        time.strftime('%I:%M%p')
    end

    def hours
        math = (self.finish - self.start)
        # divide out seconds then subrtract break time
        math = (math / 60) - self.break.to_i
        #convert to hours
        (math / 60).round(4)
    end
end
