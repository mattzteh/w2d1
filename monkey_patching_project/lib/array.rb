# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            return nil
        end
        return self.max - self.min
    end

    def average
        if self.length == 0
            return nil
        end
        return self.sum.to_f / self.length.to_f
    end

    def median
        if self.length == 0
            return nil
        end
        sorted = self.sort
        mid = (sorted.length - 1) / 2.0
        (sorted[mid.floor] + sorted[mid.ceil]) / 2.0
    end

    def counts
        count = Hash.new(0)
        self.each {|num| count[num] += 1}
        count
    end

    def my_count(value)
        count = 0
        self.each do |ele|
            if value.include?(ele)
                count += 1
            end
        end
        count
    end

    def my_index(value)
        new_arr = []
        self.each_with_index do |ele, idx|
            if value.include?(ele)
                new_arr << idx
            end
        end
        sorted = new_arr.sort
        return sorted[0]
        if sorted.length == 0
            return nil
        end
    end

    def my_uniq
        return self & self
    end

    def my_transpose
        new_arr = []
    
        self.each_with_index do |ele1, idx1|
            row = []
            self.each_with_index do |ele2, idx2|
                row << self[idx2][idx1]
            end
          new_arr << row
        end
        new_arr
    end


end
