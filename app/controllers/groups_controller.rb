class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end
    
    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to group_path(@group)
        else
            render :new
        end
    end

    def show
        @group = Group.find_by_id(params[:id])
    end

    private

    def group_params
        params.require(:group).permit(:game_title, :game_category)
    end
end
