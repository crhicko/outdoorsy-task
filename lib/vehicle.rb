class Vehicle
    attr_accessor :type, :name, :length

    def get_formatted_data
        return "#{type} #{name} #{length}"
    end

    #static
    def self.parse_length(str)
        s = str.scan(/[0-9]\w/)
        return s[0].to_i
    end
end