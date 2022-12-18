class ProductsController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
#patch and post doesn't work 
    def index 
        products = Product.all 
        render json: products 
    end 

    def show 
        product = find_product
        render json: product
    end 
 
     def create
        product = Product.create!(product_params)
        render json: product, status: :created 
    end 

    def update 
        product = find_product
        product.update!(product_params)
        render json: product
    end 

    def destroy
        product = find_product
        product.destroy
        head :no_content
    end 

    private 

    def find_product
        product = Product.find_by!(id: params[:id]) 
    end  

    def product_params 
        params.permit(:name, :description, :color, :image, :category_id, :price)
    end 

    def record_not_found 
        render json: {error: "Product not found"}, status: :not_found
    end 
    #this error is for update and show 

    # def render_unprocessable_entity_response (exception)
    #     render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    # end 
    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :render_unprocessable_entity
    end 
end
