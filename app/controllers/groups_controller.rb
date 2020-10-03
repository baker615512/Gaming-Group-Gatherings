class GroupsController < ApplicationController
    before_action :require_login
    before_action :set_group, only: [:show, :edit, :update, :destroy]

    def index
        #if params['Board Game']
        #    @groups = Group.board_game
        #elsif params['Card Game']
        #    @groups = Group.card_game
        #elsif params['RPG']
        #    @groups = Group.rpg
        #else
            @groups = Group.order(:game_title)
        #end
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
    end

    def edit
    end

    def update
        @group.update(group_params)
        redirect_to group_path(@group)
    end

    def destroy
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
        return head(:not_found) unless @group
    end
end
