class GatheringsController < ApplicationController

    def index
        @gatherings = Gathering.all
    end

    def new
        @group = Group.find_by_id(params[:group_id]) if params[:group_id]
        @gathering = Gathering.new
    end

    def create

    end

    private

    def gathering_params
        params.require(:gathering).permit(:game_cafe, :day_of_week,
        :group_id, group_attributes: %i[game_title game_category])
    end
end
