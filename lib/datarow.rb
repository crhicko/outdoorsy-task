require_relative "user"
require_relative "vehicle"

class DataRow
    attr_accessor :user, :vehicle

    def initialize(user, vehicle)
        @user = user
        @vehicle = vehicle
    end

    def get_formatted_data
        return "#{user.get_formatted_data} #{vehicle.get_formatted_data}"
    end
end