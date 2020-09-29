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

    def edit
        @group = Group.find_by_id(params[:id])
    end

    def update
        @group = Group.find_by_id(params[:id])
        @group.update(game_title: params[:group][:game_title], game_category: params[:group][:game_category])
        redirect_to group_path(@group)
    end

    def destroy
        Group.find_by_id(params[:id]).destroy
        redirect_to groups_path
    end

    private

    def group_params
        params.require(:group).permit(:game_title, :game_category)
    end
end
