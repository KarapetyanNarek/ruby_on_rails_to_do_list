class EmployeesController < ApplicationController
    http_basic_authenticate_with name: "admin@admin", password: "admin" # for authenticate

    # Show all Employees data
    def index
        @employees = Employee.paginate(page: params[:page]).per_page(10) # pagination (gem 'will_paginate')
        @companies = Company.all
    end

    # Start Created Employee data
    def new
        @employee = Employee.new
        @companies = Company.all
    end

    # Show Employee data
    def show
        @employee = Employee.find(params[:id])
        @company = Company.find( @employee.company_id)
    end

    # Create Employee data
    def create
        @company = Company.find(params[:employee][:company_id])
        if @employee = @company.employees.create(employee_params)
            redirect_to @employee
        else
            redirect_to 'new'
        end
    end

    # Update Employee data
    def update
        @employee = Employee.find(params[:id])
        
        if @employee.update(employee_params)
            redirect_to @employee
        else
            render 'edit'
        end
    end

    # Delete Employee data
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path 
    end

    # Edit Employee data
    def edit
        @employee = Employee.find(params[:id])
        @companies = Company.all
    end

    private def employee_params
        params.require(:employee).permit(:firstname, :lastname, :email, :phone, :company_id)
    end

end
