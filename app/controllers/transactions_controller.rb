class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find_by(id: params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find_by(id: params[:id])
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    # respond_to do |format|
    #   if @product.update(product_params)
    #     format.html { redirect_to @product,
    #       notice: 'Product was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @product }

    #     @transactions = Product.all.order(:title)
    #     ActionCable.server.broadcast 'transactions',
    #       html: render_to_string('store/index', layout: false)
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @product.errors,
    #       status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])

    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url,
          notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # only allow a list of trusted parameters through
    def transaction_params 
      params.require(:transaction).permit(:date, :description, :amount)
    end
end
