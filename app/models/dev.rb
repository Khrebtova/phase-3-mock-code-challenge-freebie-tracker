class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.each do |freebie|
            if freebie.name == item_name
                return true
            end
        end
        return false
    end

    def give_away(dev, freebie)
        freebie.dev = dev
        freebie.save
    end
end
