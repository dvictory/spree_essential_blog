class Spree::Blogs::Admin::BlogsController < Spree::Admin::ResourceController

  def show
    redirect_to admin_blogs_path
  end
  
private
  
  def find_resource
    Spree::Blog.find_by_permalink!(params[:id])
  end  
    
  def collection
    params[:search] ||= {}
    params[:search][:meta_sort] ||= "title.asc"
    @search = Spree::Blog.search(params[:search])
    @collection = @search.page(params[:page]).per(Spree::Config[:orders_per_page])
  end

end
