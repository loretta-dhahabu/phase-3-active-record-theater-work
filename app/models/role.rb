class Role < ActiveRecord::Base
    has_many :auditions

     def actors
        self.auditions.map {|a| a.actor}
    end

    def locations
        self.auditions.map {|a| a.location}
    end

    def lead
        self.auditions.map do |audition|
            if(audition.hired == true)
                return audition
            end
        end
        "no actor has been hired for this role"
    end

    def understudy
        sorted = self.auditions.order(hired: :desc)
        if(sorted.second.hired == true)
            return sorted.second
        end
        "no actor has been hired for understudy for this role"
    end
end