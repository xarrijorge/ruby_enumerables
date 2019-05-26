module Enumerable
    def my_each
        newSelf = self.to_a
        if block_given?
            i = 0
            while i < newSelf.length
                yield(newSelf[i])
                i += 1
            end
            self
        end
    end

    def my_each_with_index
        if block_given?
            for i in 0..self.length do
                yield(self[i], i)
            end 
        else
            self
        end
    end

    def my_map
        arr = []
        if block_given?
            self.my_each {|x| arr << yield(x)}
        else
            arr
        end
        arr
    end

    def my_count
        if block_given?
            count = 0
            self.my_each do |x|
                count += 1 if yield(x)
            end
        else
            count = self.length
        end
        count
    end

