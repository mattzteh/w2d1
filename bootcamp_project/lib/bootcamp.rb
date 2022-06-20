class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, k| hash[k] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(candidate)
        @teachers << candidate
    end

    def enroll(prospect)
        if @students.length < @student_capacity
            @students << prospect
            return true
        else
            return false
        end
    end

    def enrolled?(person)
        @students.map(&:downcase).include?(person.downcase)
    end

    def student_to_teacher_ratio
        return @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if enrolled?(student) == true
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        sum = 0

        if enrolled?(student) == true
            @grades[student].each do |grade|
                sum += grade
            end
        else
            return nil
        end
        if @grades[student].length == 0
            return nil
        end
        average = sum / @grades[student].length
        average
    end
end
