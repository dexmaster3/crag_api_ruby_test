class NodesController < ApplicationController
  before_action :set_crag
  before_action :set_crag_node, only: [:show, :update, :destroy]

  # GET /crags/:crag_id/nodes
  def index
    json_response(@crag.nodes)
  end

  # GET /crags/:crag_id/nodes/:id
  def show
    json_response(@node)
  end

  # POST /crags/:crag_id/nodes
  def create
    @crag.nodes.create!(node_params)
    json_response(@crag, :created)
  end

  # PUT /crags/:crag_id/nodes/:id
  def update
    @node.update(node_params)
    head :no_content
  end

  # DELETE /crags/:crag_id/nodes/:id
  def destroy
    @node.destroy
    head :no_content
  end

  private

  def node_params
    params.permit(:xcoord, :ycoord, :weight)
  end

  def set_crag
    @crag = Crag.find(params[:crag_id])
  end

  def set_crag_node
    @node = @crag.nodes.find_by!(id: params[:id]) if @crag
  end
end