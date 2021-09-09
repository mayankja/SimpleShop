class Api::ProductsController < Api::ApiController
  before_action :authorize_request
  before_action :set_product, except: [:create, :index]
  load_and_authorize_resource param_method: :product_params

  #GET /api/products
  def index
    products = Product.all
    render json: products
  end

  # POST /api/products
  def create
    product = Product.create(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: { errors: product.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  # PATCH /api/products/:id
  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: { errors: @product.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  # DELETE /api/products/:id
  def destroy
    if @product.destroy
      render json: @product, status: :ok
    else
      render json: { errors: @product.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image, :sku, :stock_number, :region_id, :price)
  end
end
