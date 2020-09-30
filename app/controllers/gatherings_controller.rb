class GatheringsController < ApplicationController
    before_action :require_login

    def index
        @gatherings = Gathering.all
    end

    def new
        @group = Group.find_by_id(params[:group_id]) if params[:group_id]
        @gathering = Gathering.new
    end

    def create
        @gathering = current_user.gatherings.create(gathering_params)
        redirect_to gathering_path(@gathering)
    end

    def show
        set_gathering
    end

    def edit
        set_gathering
    end

    def update
        set_gathering
        @gathering.update(game_cafe: params[:gathering][:game_cafe], day_of_week: params[:gathering][:day_of_week])
        redirect_to gathering_path(@gathering)
    end

    def destroy
        Gathering.find_by_id(params[:id]).destroy
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
    end
end
