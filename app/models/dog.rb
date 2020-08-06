class Dog < ApplicationRecord
    has_many :employees

    def owners
        Employee.all.filter do |employee|
            employee.id == self.id
        end
    end
end
