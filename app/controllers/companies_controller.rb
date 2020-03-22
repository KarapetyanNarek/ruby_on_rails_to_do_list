class CompaniesController < ApplicationController
    http_basic_authenticate_with name: "admin@admin", password: "admin" # for authentication

    # Show all companies data
    def index
        @companies = Company.paginate(page: params[:page]).per_page(10) # pagination (gem 'will_paginate')
    end

    # Start create new Company data
    def new
        @company = Company.new
    end

    # Show company data
    def show
        @company = Company.find(params[:id])
    end

    # Edit Company data
    def edit
        @company = Company.find(params[:id])
    end
    
    # Update Company data
    def update
        @company = Company.find(params[:id])

        if @company.update(company_params)
            redirect_to @company
        else
            render 'edit'
        end

    end

    # Delete Company data
    def destroy
        @company = Company.find(params[:id])
        @company.destroy
        redirect_to companies_path    
    end

    # Create new Company data
    def create
        # render plain: params[:company].inspect
        @company = Company.new(company_params)  # Company.create() = Company.new() + Company.save
        
        if @company.save
           redirect_to @company
        else
            render 'new'
        end
    end

    private def company_params
        params.require(:company).permit(:logo, :name, :email, :website)
    end
end