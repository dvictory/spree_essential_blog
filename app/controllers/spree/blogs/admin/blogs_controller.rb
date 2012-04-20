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
<<<<<<< HEAD
    params[:search][:meta_sort] ||= "title.asc"
    @search = Spree::Blog.search(params[:search])
=======
    params[:search][:meta_sort] ||= "name.asc"
    @search = Spree::Blog.metasearch(params[:search])
>>>>>>> origin/master
    @collection = @search.page(params[:page]).per(Spree::Config[:orders_per_page])
  end

end
