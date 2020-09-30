class GroupsController < ApplicationController
    before_action :require_login

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
        set_group
    end

    def edit
        set_group
    end

    def update
        set_group
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

    def require_login
        return head(:forbidden) unless session.include? :gamer_id
    end

    def set_group
        @group = Group.find_by_id(params[:id])
    end
end
