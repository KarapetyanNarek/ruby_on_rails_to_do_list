class EmployeesController < ApplicationController
    http_basic_authenticate_with name: "admin@admin", password: "admin"

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @companies = Company.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def create
        # render plain: params[:employee].inspect
        @employee = Employee.new(employee_params) 
        if @employee.save
           redirect_to @employee
        else
            render 'new'
        end
    end

    def update
        @employee = Employee.find(params[:id])

        if @employee.update(employee_params)
            redirect_to @employee
        else
            render 'edit'
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path 
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    private def employee_params
        params.require(:employee).permit(:firstname, :lastname, :email, :phone, :company)
    end

end
