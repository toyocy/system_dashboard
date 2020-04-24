class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]
  before_action :set_system, only: [:new, :edit, :update]
  before_action :authenticate_user!

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all.includes(
      :system
    ).order(hostname: :ASC)
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      if params[:type] == "from_system_detail"
        redirect_back fallback_location: system_path, notice: 'Server was successfully destroyed.'
        return
      end
      format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    def set_system
      @systems = System.available
    end
    
    # Only allow a list of trusted parameters through.
    def server_params
      params.require(:server).permit(:hostname, :url, :description, :system_id)
    end
end
