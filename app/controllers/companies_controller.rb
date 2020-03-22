class CompaniesController < ApplicationController
    http_basic_authenticate_with name: "admin@admin", password: "admin"
    #except: [:index]

    def index
        @companies = Company.all
    end

    def new
        @company = Company.new
    end

    #show company data
    def show
        @company = Company.find(params[:id])
    end

    #edit company data
    def edit
        @company = Company.find(params[:id])
    end
    
    #apdate company data
    def update
        @company = Company.find(params[:id])

        if @company.update(company_params)
            redirect_to @company
        else
            render 'edit'
        end

    end

    #delete company
    def destroy
        @company = Company.find(params[:id])
        @company.destroy
        redirect_to companies_path    
    end

    #create new company
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