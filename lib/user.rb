class User
    attr_accessor :first_name, :last_name, :email

    def full_name
        return "#{first_name} #{last_name}"
    end

    def get_formatted_data
        return "#{full_name} #{email}"
    end
end