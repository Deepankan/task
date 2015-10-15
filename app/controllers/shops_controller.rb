class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = current_user.shops


  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
   @shop.user_id = current_user.id
    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else

        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def image_check

  @shop = Shop.find_by_id(params[:format])

  end

 def map

   @shop = Shop.find_by_id(params[:format])
   @lat_lang = Geocoder.search(@shop.shop_address )
   @lat =  @lat_lang.present? ? @lat_lang[0].latitude : 34.513299
   @lang = @lat_lang.present? ? @lat_lang[0].longitude : -94.1628807
   @address =  @lat_lang.present? ? @lat_lang[0].formatted_address : @shop.shop_address
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop

      @shop = Shop.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params

       params.require(:shop).permit(:shop_name,:shop_address,:shop_description,:avatar)
    end
end
