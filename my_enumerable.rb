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

