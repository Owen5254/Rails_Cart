class Cart
    SessionKey = :cart5254


    attr_reader :items

    def initialize(items = [])
        @items = items
    end
    
    def add_item(product_id)
        # 用find function 找items陣列中是否有此product_id
        found_item = @items.find {|item| item.product_id == product_id}

        if found_item
            found_item.increment
        else
            @items << CartItem.new(product_id)
        end
    end
    
    def empty?
        @items.empty?
    end

    def total_price
        # price 是存在 items 下的各個 item 內  
        @items.reduce(0) {|sum, item| sum + item.price}
    end

    def serialize
        all_items = @items.map { |item| {"product_id" => item.product_id, "quantity" => item.quantity}}

        {"items" => all_items}
    end


    # 因為 Cart.from_hash 是類別方法，所以在定義方法的時候加上了 self.
    def self.from_hash(hash)
        # blank? 是rails中結合 nil? 和 empty?的方法
        if hash.blank?
            new []
        else
            new hash["items"].map { |item_hash|
                CartItem.new(item_hash["product_id"], item_hash["quantity"])
            }
        end
    end
end