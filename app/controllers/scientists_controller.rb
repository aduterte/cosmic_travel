class ScientistsController < ApplicationController
    before_action :find_scientist, only: [:show, :edit]

    def index 
        @scientists = Scientist.all
    end

    def show    
       
    end

    def new
        @scientist = Scientist.new
    end

    def create 
        @scientist = Scientist.create(allowed_params)
        if @scientist.valid?
            @scientist.save
            redirect_to scientist_path(@scientist)
        else
            render :new
        end
    end

    def edit    
        
    end

    def update
        @scientist = find_scientist
        @scientist.update(allowed_params)
        if @scientist.valid?
            @scientist.save
            redirect_to scientist_path(@scientist)
        else
            render :edit
        end
    end

    def destroy
        @scientist = find_scientist
        @scientist.destroy
        redirect_to scientists_path
    end

    private

    def find_scientist 
        @scientist = Scientist.find(params[:id])
    end

    def allowed_params
        params.require(:scientist).permit(:name, :field_of_study)
    end
end
