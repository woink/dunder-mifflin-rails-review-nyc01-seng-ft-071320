class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update]
    
    def index
        @employees = Employee.all
    end

    def show
    end
    
    def new 
        @employee = Employee.new
        # @dogs = Dog.all
    end
    
    def edit
    end

    def create 
        @employee = Employee.create(employee_params)
        redirect_to employee_path(@employee)
    end

    def update
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end

end

