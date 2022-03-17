require_relative "lib/vehicle"
require_relative "lib/user"
require_relative "lib/fileparser"
require_relative "lib/datarow"
require_relative "lib/util.rb"

def parse_input()
    fileParsers = Array.new
    fileParser = nil
    sort_by = nil
    #loop through cmd args and skip if not a -arg
    ARGV.each_with_index do |cmd, i|
        next if cmd[0] != '-'
        case cmd
        when '-f'
            fileParser = FileParser.new
            fileParser.file = ARGV[i+1]
            fileParser.delimiter = ARGV[i+2]
            fileParsers.append(fileParser)
        when '-s'
            sort_by = ARGV[i+1]
        end
    end

    data = Array.new
    fileParsers.each do |fp|
        fp.parse_into_array(data)
    end
    return data, sort_by
end

def print_data(data)
    # puts "#{row[0].get_formatted_data} #{row[1].get_formatted_data}"
    data.each do |row|
        puts row.get_formatted_data
    end
end

if __FILE__ == $0
    if ARGV.empty?
        self.help
    end

    #parse files into data array, get sorting style
    data,sort_by = self.parse_input

    case sort_by
    when 'vtype'
        data = data.sort_by {|row| row.vehicle.type.downcase}
    when 'name'
        data = data.sort_by {|row| row.user.full_name.downcase}
    end

    self.print_data(data)

end