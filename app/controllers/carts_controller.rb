class CartsController < ApplicationController
    
    def add
        current_cart.add_item(params[:id])
        session[Cart:"SessionKey"] = current_cart.serialize
        flash[:success] = "已加入購物車"
        redirect_to products_path

    end

    def destroy
        session[Cart:"SessionKey"] = nil
        flash[:alert] = "已清空購物車" 
        redirect_to cart_path
    end

end
