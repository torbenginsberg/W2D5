require "byebug"

class Item
    
    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        return false if date_arr.length != 3 || date_arr[0].length != 4 || date_arr[1].length != 2 || date_arr[2].length != 2
        return false if date_arr[1].to_i < 1 || date_arr[1].to_i > 12
        return false if date_arr[2].to_i < 1 || date_arr[2].to_i > 31
        true
    end

    attr_accessor :title, :description
    attr_reader :deadline

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        raise "Invalid Date" if !Item.valid_date?(@deadline)
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "Invalid date"
        end
    end
end
