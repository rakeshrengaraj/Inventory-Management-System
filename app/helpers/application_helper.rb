module ApplicationHelper

    def changeColor(product_warehouse)
        if (product_warehouse.item_count <= product_warehouse.low_item_threshold)
            return "bg-danger"
        else
            return "bg-light"
        end    
    end    


    

end
