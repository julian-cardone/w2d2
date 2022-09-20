require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    attr_reader :name, :funding, :employees, :salaries

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(startup)
        if @funding > startup.funding
            return true
        else
            return false
        end
    end

    def hire(name, title)
        unless @salaries.has_key?(title)
            raise ArgumentError.new "title is invalid"
        end
        @employees << Employee.new(name, title)
    end

    def size
        return @employees.length
    end

    def pay_employee(emp_instance)
        title = emp_instance.title
        unless @funding >= salaries[title]
            raise ArgumentError.new "ya broke"
        end
        emp_instance.pay(salaries[title])
        @funding -= salaries[title]
    end

    def payday
        employees.each {|person| pay_employee(person)}
    end

end
