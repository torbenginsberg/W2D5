require_relative "item.rb"

class List
    attr_accessor :label
    
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && index < @items.length
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            false
        end
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else
            false
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------------------------"
        puts @label.upcase
        puts "------------------------------------------"
        puts "Index | Item                  | Deadline "
        puts "------------------------------------------"
        @items.each_with_index do |item, i|
            puts "#{i}     | #{item.title}             | #{item.deadline}  "
        end
        puts "------------------------------------------"
    end

    def print_full_item(index)
        if valid_index?(index)
            full_item = @items[index]
            puts "------------------------------------------"
            puts "Title: #{full_item.title}"
            puts "Deadline: #{full_item.deadline}"
            puts "Description: #{full_item.description}"
            puts "------------------------------------------"
        end
    end

    def print_priority
        full_item = self.priority
        puts "------------------------------------------"
        puts "Title: #{full_item.title}"
        puts "Deadline: #{full_item.deadline}"
        puts "Description: #{full_item.description}"
        puts "------------------------------------------"
    end

    def up(index, amount=1)
        if valid_index?(index)
            idx = index
            amount.times do
                break if idx == 0
                self.swap(idx, idx - 1)
                idx -= 1
            end
            true
        else
            false
        end
    end

    def down(index, amount=1)
        if valid_index?(index)
            idx = index
            amount.times do
                break if idx == @items.length - 1
                self.swap(idx, idx + 1)
                idx += 1
            end
            true
        else
            false
        end
    end

    def sort_by_date!
        @items.sort_by!{ |deadline| @deadline }.reverse!
    end
end