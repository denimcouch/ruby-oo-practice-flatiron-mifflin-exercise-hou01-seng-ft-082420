class Employee
    attr_reader :name, :salary, :manager

    @@all = []

    def initialize(name, salary, manager)
        @name = name
        @salary = salary
        @manager = manager
        self.class.all << self
    end
    def self.all
        @@all
    end

    def self.paid_over(amount)
        self.all.select{|e| e.salary > amount}
    end
    
    def self.find_by_department(department)
        self.all.find{|e| e.manager.department == department}
    end

    def tax_bracket
        self.class.all.select{|e| 
            (self.salary - e.salary).between?(-1000,1000) && e != self
        }
    end
    
end
