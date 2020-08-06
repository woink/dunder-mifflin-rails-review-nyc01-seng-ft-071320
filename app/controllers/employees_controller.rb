class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def create
        @employee = Employee.new(employee_params(:first_name, :last_name, :alias, :title, :office))
        @employee.save
        redirect_to employee_path(@employee)
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params(:first_name, :last_name, :alias, :title, :office))
        redirect_to employee_path(@employee)
    end

    private

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end
end

