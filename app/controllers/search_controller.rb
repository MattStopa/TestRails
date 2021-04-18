class SearchController < ApplicationController
    layout false
    def term
        return render :template => "search/_term"
    end
end