class BlogsController < ApplicationController
  def index
    blogs = Blog.all
    render json: blogs, status: 200
  end

  def show
    blog = Blog.find_by(id: params[:id])
    if blog
      render json: blog, status: 200
    else
      render json: {error: 'No Blog Found'}
    end
  end

  def create
    blog = Blog.new(
      title: blog_params[:title],
      description: blog_params[:description],
      publishing_date: blog_params[:publishing_date]
    )

    if blog.save
      render json: blog, status: 200
    else
      render json: {error: 'Product not created'}
    end
  end

  private

  def blog_params
    params.require(:blog).permit(
      [
        :title, :description, :publishing_date
      ]
    )
  end
end
