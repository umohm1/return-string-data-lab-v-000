class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_attributes)
        @product.save
        redirect_to (products_path)
    end

    def body
        @product = Product.find(params[:id])
        render plain: product.description
    end

    def inventory
        @product = Product.find(params[:id])
        if  @product.inventory != 0
            render plain: "true"
        else
            render plain: "false"
        end
    end

    def description
        @product = Product.find(params[:id])
        render plain: @product.description
    end

    private

    def product_attributes
        params.require(:product).permit(:name, :price, :description, :inventory)
    end

end
