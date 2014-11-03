require 'spec_helper'

describe Insightly::DSL::Comments do
  let(:comment_id) { 3469515 }

  # GET /v2.1/Comments/{id}
  describe '#get_comment' do
    it 'returns a comment' do
      VCR.use_cassette('get_comment') do
        expect(client.get_comment(comment_id)).to be_a(Comment)
      end
    end
  end

  # POST /v2.1/Comments?c_id={c_id}&filename={filename}
  describe '#create_comment_attachment' do
    it 'returns a response with code 201' do
      VCR.use_cassette('create_comment_attachment') do
        response = client.create_comment_attachment(comment_id, '1.jpg')
        expect(response.status).to eq(201)
      end
    end
  end

  # PUT /v2.1/Comments
  describe '#update_comment' do
    it 'updates a comment' do
      VCR.use_cassette('update_comment') do
        comment = client.get_comment(comment_id)
        response = client.update_comment(comment)
        expect(response).to be_a(Comment)
      end
    end
  end

  # DELETE /v2.1/Comments/{id}
  describe '#delete_comment' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_comment') do
        response = client.delete_comment(comment_id)
        expect(response.status).to eq(202)
      end
    end
  end
end
