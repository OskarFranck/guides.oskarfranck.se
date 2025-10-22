module Users
  class GuidesController < ApplicationController
  include ApplicationHelper
  
    def index

      puts '#' * 1000
      puts params
      @search_text = params[:search]
      if logged_in? && current_user[:id]
        current_user_id = current_user[:id]
        if current_user_id == params[:user_id].to_i
          puts 'if"""""""""""""""""""'
          guides = Guide.where(creator_id: params[:user_id]).includes(:creator)
        else
          puts 'else###############################'
          guides = Guide.where(creator_id: params[:user_id]).includes(:creator).and(Guide.where(is_draft: false))
        end
        
        if params[:search] != nil && !params[:search].empty?
          @guides = guides
            .where("title ILIKE ?", "%" + params[:search] + "%")
            .or(guides.where("description ILIKE ?", "%" + params[:search] + "%"))
            .or(guides.where("body ILIKE ?", "%" + params[:search] + "%")).includes(:creator)
        else
          @guides = guides
        end
      else
        flash[:alert] = "Not authorized"
        redirect_back_or_to guides_path
      end
    end
  end
end
