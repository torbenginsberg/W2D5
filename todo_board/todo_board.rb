require_relative "list.rb"
require_relative "item.rb"

class TodoBoard
    def initialize(label)
        @list = List.new("label")
    end

    def get_command
        
    end
end