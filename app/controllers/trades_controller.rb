class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /trades
  # GET /trades.json
  def index
    @trade = current_user.trades.build
    @trades = current_user.trades.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = current_user.trades.build(trade_params)

    if @trade.save
      flash[:success] = "Trade successfully logged."
      redirect_to action: 'index'
    else
      render action: 'index'
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to action: 'index', notice: 'Trade was updated.' }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'Trade was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:result, :description, :tag_list, :screenshot)
    end
end
