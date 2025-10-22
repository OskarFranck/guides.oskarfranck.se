class GuidesController < ApplicationController
  include SessionsHelper

  def index

    @search_text = params[:search]
    guides = Guide.where(is_draft: false).includes(:creator).order(created_at: :desc)

    if params[:search] != nil && !params[:search].empty?
      puts 'if' *10
      @guides = guides
        .where("title ILIKE ?", "%" + params[:search] + "%")
        .or(guides.where("description ILIKE ?", "%" + params[:search] + "%"))
        .or(guides.where("body ILIKE ?", "%" + params[:search] + "%")).order(created_at: :desc)
    else
      @guides = guides
    end
  end

  def show
    @guide = Guide.where(id: params[:id]).first
    ## find users name for displaying author
    ## if statement is only to prevent error when search results return articles you are not allowd to see, rm when fixed
    unless @guide
      flash[:alert] = "Not allowed to view article" 
      redirect_back_or_to guides_path 
    end
    #if @guide
    #  user = User.find_by(id: @guide.creator_id)
    #  @username = user.name
    #end
  end

  def new
    if logged_in? && current_user[:id]
      @guide = Guide.new
    else
      flash[:alert] = "Not allowed to write articles" 
      redirect_back_or_to guides_path 
    end
  end

  def create
    if logged_in? && current_user[:id]
      ## Using helper method "current_user"
      ## Not sure if I will use helper or collect data from session directry.
      current_user_id = session[:user_id]
      current_user = User.find_by_id(current_user_id)
      if guide_params[:is_draft] == '1'
        guide_params[:is_draft] = true
      else
        guide_params[:is_draft] = false
      end
      if guide_params[:free_for_all] == '1'
        guide_params[:free_for_all] = true
      else
        guide_params[:free_for_all] = false
      end
      @guide = Guide.new(guide_params)
      @guide.creator = current_user

      if @guide.save
        redirect_to @guide
      else
        render :new, status: :unprocessable_entity
      end

    else
      flash[:alert] = "Not allowed to create articles" 
      redirect_back_or_to guides_path 
    end
  end

  def edit
    if logged_in? && current_user[:id]
      guide = Guide.find(params[:id])
      if guide.creator_id == current_user[:id]
        @guide = guide
      end
    else

      flash[:alert] = "Not allowed to write articles" 
      redirect_back_or_to guides_path 
    end
  end

  def update
    if logged_in? && current_user[:id]
      @guide = Guide.find(params[:id])

      if @guide.update(guide_params)
        redirect_to @guide
      else
        render :edit, status: :unprocessable_entity
      end
    else
      flash[:alert] = "Not allowed to update this article"
      redirect_back_or_to guides_path
    end
  end

  def destroy
    if logged_in? && current_user[:id]
      @guide = Guide.find(params[:id])
      user = @guide.creator.id
      if @guide.destroy
        redirect_to({controller: 'users', action: 'show', id: user})
      end
    else
      flash[:alert] = "Not allowed to delete article"
    end
  end

  private

  def guide_params
    params.require(:guide).permit(:title, :description, :introduction, :body, :free_for_all, :is_draft)
  end
end
