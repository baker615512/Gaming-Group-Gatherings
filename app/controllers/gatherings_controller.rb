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

end
