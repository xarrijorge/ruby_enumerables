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
        my_arr = []
        if block_given?
            self.my_each {|x| my_arr << yield(x)}
        else
            my_arr
        end
        my_arr
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

    def my_all?
        if block_given?
            self.my_each do |x|
                return false unless yield(x)
            end
            true
        else
            self
        end  
    end

    def my_any?
        if block_given?
            self.my_each do |x|
                return true if yield(x)
            end
            false
        else
           self 
        end
    end

    def my_none?
        if block_given?
            self.my_each do |x|
                return false if yield(x)
            end
            true
        else
            self
        end
    end

    def my_select
        my_arr = []
        if block_given?
            self.my_each {|x| my_arr << x if yield(x)}
            my_arr
        else
            self
        end
    end

    alias my_filter my_select
    
    def my_inject(default = nil)
        default ? total = default : total = self[0]
        if block_given?
            for i in self[1..self.length] do
                total = yield(total, i)
            end
            total
        else
            self
        end
    end

    def multiply_els(my_array)
        my_array.my_inject{|sum, n| sum * n}
    end

end
