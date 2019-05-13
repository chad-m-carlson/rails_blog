class PagesController < ApplicationController
  def index
    @pages = Page.order(:author)
    # render :index
  end

  def show
    @page = Page.find(params[:id])
    # render :show
  end

  def new
    @page = Page.new #makes our form
    # render :new
  end

  def create #creates the actual instance
    @page = Page.new(page_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id]) #get request to go to form to edit page
    # render :edit
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title, :author, :body)
    end
end
