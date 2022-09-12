class ProductsController < ApplicationController
    before_action :find_product, only: [:edit, :update, :destroy]

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            #成功
            redirect_to products_path, notice: "新增商品完成"
        else
            #失敗
            render :new
        end
    end

    def edit
        
    end

    # 網址以 PUT 或 PATCH 發送資料時，會觸發 Controller 的 update 方法
    def update      
        if @product.update(product_params)
            #成功
            redirect_to products_path, notice: "商品更新成功"
        else
            render :edit
        end
    end
    
    # 網址以 DELETE 發送資料時，會觸發 Controller 的 destroy 方法
    def destroy
        @product.destroy
        redirect_to products_path, notice: "商品已刪除"
    end

    private
    # 資料清洗
    def find_product
        @product = Product.find_by(id: params[:id])
        redirect_to products_path, notice: "無此商品" unless @product
    end

    def product_params
        params.require(:product).permit(:title, :description, :price)
    end
end
