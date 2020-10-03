class GatheringsController < ApplicationController
    before_action :require_login
    before_action :set_gathering, only: [:show, :edit, :update, :destroy]

    def index
        if params[:group_id]
            @gatherings = Group.find_by_id(params[:group_id]).gatherings
        else
            @gatherings = Gathering.all
        end
    end

    def new
        @group = Group.find_by_id(params[:group_id]) if params[:group_id]
        @gathering = Gathering.new
    end

    def create
        @gathering = current_user.gatherings.new(gathering_params)
        if @gathering.save
            redirect_to gathering_path(@gathering)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @gathering.update(gathering_params)
            redirect_to gathering_path(@gathering)
        else
            render :edit
        end
    end

    def destroy
        @gathering.destroy
        redirect_to gatherings_path
    end

    private

    def gathering_params
        params.require(:gathering).permit(:game_cafe, :day_of_week, :gamer_id,
        :group_id, group_attributes: [:game_title, :game_category])
    end

    def require_login
        return head(:forbidden) unless session.include? :gamer_id
    end

    def set_gathering
        @gathering = Gathering.find_by_id(params[:id])
        return head(:not_found) unless @gathering
    end
end
