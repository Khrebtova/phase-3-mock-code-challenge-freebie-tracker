class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies
    
    def give_freebie(dev, item_name, value)
        freebie = Freebie.new
        freebie.dev = dev
        freebie.company = self
        freebie.name = item_name
        freebie.value = value
        freebie.save
    end

    def self.oldest_company
        result = Company.order(:founding_year).first
        puts "The oldest company is #{result.name} found in #{result.founding_year}."
        Company.order(:founding_year).first
    end

 

    
end
