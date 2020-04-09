class MissionsController < ApplicationController

    def new 
        @mission = Mission.new
    end

    def create 
        @mission = Mission.create(allowed_params)
        if @mission.valid?
            @mission.save
            redirect_to scientist_path(@mission.scientist)
        else
            render :new
        end
    end

    private 

    def allowed_params 
        
        params.require(:mission).permit(:name, :scientist_id, :planet_id)
    end

end
