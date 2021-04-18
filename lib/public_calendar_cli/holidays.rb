class Holidays
    attr_accessor :date, :name, :countryCode
    @@all =[]

    def initialize(holiday_hash)
        holiday_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_selection(holiday_name)
        (holiday_name)
        self.all.detect do |holiday|
            holiday.name.downcase == holiday_name.downcase
        end
    end
end