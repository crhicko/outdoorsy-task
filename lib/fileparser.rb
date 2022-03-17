require_relative "vehicle"
require_relative "user"
require_relative "datarow"

class FileParser
    attr_accessor :file, :delimiter

    #optional params file and delimiter are here for testing purposes
    def parse_into_array(arr, file = @file, delimiter = @delimiter)
        if delimiter == nil or delimiter.length != 1
            raise "Invalid Delimiter, single characters only,"
        end
        File.readlines(file).each do |line|
            #Doing it this way so we can extend in the future and support users with multiple vehicles
            data_row = DataRow.new(User.new, Vehicle.new)

            split_string = line.chomp.split(delimiter)
            #make sure we have no extra data
            if split_string.length != 6
                raise "Unexpected number of columns"
            end
            split_string.each_with_index do |str, i|
                case i
                when 0
                    data_row.user.first_name = str
                when 1
                    data_row.user.last_name = str
                when 2
                    data_row.user.email = str
                when 3
                    data_row.vehicle.type = str
                when 4
                    data_row.vehicle.name = str
                when 5
                    data_row.vehicle.length = Vehicle.parse_length(str)
                end
            end
            arr.append(data_row)
        end
    end
end