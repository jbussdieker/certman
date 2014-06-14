class PrivateKeysController < ApplicationController
  before_action :set_private_key, only: [:show, :edit, :update, :destroy]

  # GET /private_keys
  # GET /private_keys.json
  def index
    @private_keys = PrivateKey.all
  end

  # GET /private_keys/1
  # GET /private_keys/1.json
  def show
  end

  # GET /private_keys/new
  def new
    @private_key = PrivateKey.new
  end

  # GET /private_keys/1/edit
  def edit
  end

  # POST /private_keys
  # POST /private_keys.json
  def create
    @private_key = PrivateKey.new(private_key_params)

    respond_to do |format|
      if @private_key.save
        format.html { redirect_to @private_key, notice: 'Private key was successfully created.' }
        format.json { render action: 'show', status: :created, location: @private_key }
      else
        format.html { render action: 'new' }
        format.json { render json: @private_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /private_keys/1
  # PATCH/PUT /private_keys/1.json
  def update
    respond_to do |format|
      if @private_key.update(private_key_params)
        format.html { redirect_to @private_key, notice: 'Private key was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @private_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_keys/1
  # DELETE /private_keys/1.json
  def destroy
    @private_key.destroy
    respond_to do |format|
      format.html { redirect_to private_keys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_key
      @private_key = PrivateKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_key_params
      params.require(:private_key).permit(:key_size, :encoded_key)
    end
end
