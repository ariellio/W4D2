require_relative "Employee.rb"
class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss)
        @employees = []
        super(name, title, salary, boss)
    end

    def bonus(multiplier)
       total_bonus = 0
        
       employees.each do |employee|
            total_bonus += employee.salary  
       end
       total_bonus * multiplier
    end

    def add_employees(employee)
        employee.boss.employees << employee
        if employee.is_a?(Manager)
            employee.boss.employees += employee.employees
        end
    end




end

ned = Manager.new('ned', 'Founder', 1000000, nil)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)
darren.add_employees(shawna)
darren.add_employees(david)
ned.add_employees(darren)
print ned.bonus(5)