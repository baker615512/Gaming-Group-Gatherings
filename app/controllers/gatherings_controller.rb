class GatheringsController < ApplicationController

    def index
        @gatherings = Gathering.all
    end
    
    def new
        @gathering = Gathering.new
    end

    def create

    end

end
