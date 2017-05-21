require 'rails_helper'

RSpec.describe 'Nodes API' do
  # Initialize the test data
  let!(:crag) { create(:crag) }
  let!(:nodes) { create_list(:node, 20, crag_id: crag.id) }
  let(:crag_id) { crag.id }
  let(:id) { nodes.first.id }

  # Test suite for GET /crags/:crag_id/nodes
  describe 'GET /crags/:crag_id/nodes' do
    before { get "/crags/#{crag_id}/nodes" }

    context 'when crag exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all crag nodes' do
        expect(json.size).to eq(20)
      end
    end

    context 'when crag does not exist' do
      let(:crag_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Crag/)
      end
    end
  end

  # Test suite for GET /crags/:crag_id/nodes/:id
  describe 'GET /crags/:crag_id/nodes/:id' do
    before { get "/crags/#{crag_id}/nodes/#{id}" }

    context 'when crag node exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the node' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when crag node does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Node/)
      end
    end
  end

  # Test suite for PUT /crags/:crag_id/nodes
  describe 'POST /crags/:crag_id/nodes' do
    let(:valid_attributes) { { weight: 34, xcoord: 394.44 } }

    context 'when request attributes are valid' do
      before { post "/crags/#{crag_id}/nodes", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/crags/#{crag_id}/nodes", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Xcoord can't be blank/)
      end
    end
  end

  # Test suite for PUT /crags/:crag_id/nodes/:id
  describe 'PUT /crags/:crag_id/nodes/:id' do
    let(:valid_attributes) { { xcoord: 46.473 } }

    before { put "/crags/#{crag_id}/nodes/#{id}", params: valid_attributes }

    context 'when node exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the node' do
        updated_node = Node.find(id)
        expect(updated_node.xcoord).to match(46.473)
      end
    end

    context 'when the node does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Node/)
      end
    end
  end

  # Test suite for DELETE /crags/:id
  describe 'DELETE /crags/:id' do
    before { delete "/crags/#{crag_id}/nodes/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end