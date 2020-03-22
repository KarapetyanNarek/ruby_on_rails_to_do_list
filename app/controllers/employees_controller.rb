class EmployeesController < ApplicationController
    http_basic_authenticate_with name: "admin@admin", password: "admin"

    def index; end

    def new
        
    end

    def create
        # render plain: params[:company].inspect
    end
end
