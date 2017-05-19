class CragsController < ApplicationController
  before_action :set_crag, only: [:show, :update, :destroy]

  # GET /crags
  def index
    @crags = Crag.all
    json_response(@crags)
  end

  # POST /crags
  def create
    @crag = Crag.create!(crag_params)
    json_response(@crag, :created)
  end

  # GET /crags/:id
  def show
    json_response(@crag)
  end

  # PUT /crags/:id
  def update
    @crag.update(crag_params)
    head :no_content
  end

  # DELETE /crags/:id
  def destroy
    @crag.destroy
    head :no_content
  end

  private

  def crag_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_crag
    @crag = Crag.find(params[:id])
  end
end
