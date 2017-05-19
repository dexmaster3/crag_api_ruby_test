require 'rails_helper'

RSpec.describe 'Crags API', type: :request do
  let!(:crags) { create_list(:crag, 10) }
  let(:crag_id) { crags.first.id }

  # Test got GET /crags
  describe 'GET /crags' do
    before { get '/crags' }
    it 'returns crags' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  # Test for GET /crags/:id
  describe 'GET /crags/:id' do
    before {get "/crags/#{crag_id}"}

    context 'when the record exists' do
      it 'returns the crag' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(crag_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      let(:crag_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Crag/)
      end
    end
  end

  # Test for POST /crags
  describe 'POST /crags' do
    let(:valid_attributes) { {title: 'Test Main Crag', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/crags', params: valid_attributes }

      it 'creates a crag' do
        expect(json['title']).to eq('Test Main Crag')
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/crags', params: {title: 'Badcrag'}}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test for PUT /crags/:id
  describe 'PUT /crags/:id' do
    let(:valid_attributes) { { title: 'Great Crag'} }

    context 'when the record exists' do
      before { put "/crags/#{crag_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test for DELETE /crags/:id
  describe 'DELETE /crags/:id' do
    before { delete "/crags/#{crag_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end


end
