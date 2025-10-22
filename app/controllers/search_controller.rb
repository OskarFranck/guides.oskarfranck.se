class SearchController < ApplicationController
  def index
    if params[:search_category] == 'guides'
      @guides = Guide
          .where("title ILIKE ?", "%" + params[:query] + "%").and(Guide.where(is_draft: false))
          .or(Guide.where("description ILIKE ?", "%" + params[:query] + "%")).and(Guide.where(is_draft: false))
          .or(Guide.where("body ILIKE ?", "%" + params[:query] + "%")).and(Guide.where(is_draft: false))
      puts 'A'*40
    else
      puts 'some thing is wrong'
    end
  end
end
