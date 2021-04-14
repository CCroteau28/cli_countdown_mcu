class API
    def self.get_data
        response = RestClient.get("https://date.nager.at/api/v2/publicholidays/2021/US")
        holidays_array = JSON.parse(response)
        holidays_array.each do |holiday|
            Holidays.new(holiday)
            # binding.pry
        end
        # binding.pry
    end
end
