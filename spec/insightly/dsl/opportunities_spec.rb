require 'spec_helper'

describe Insightly::DSL::Opportunities do
  let(:opportunity_id) { 4070112 }

  # GET /v2.1/Opportunities/{id}
  describe '#get_opportunity' do
    it 'returns an opportunity' do
      VCR.use_cassette('get_opportunity') do
        expect(client.get_opportunity(opportunity_id)).to be_a(Opportunity)
      end
    end
  end

  # GET /v2.1/Opportunities/{c_id}/Emails
  describe '#get_opportunity_emails' do
    it 'returns an opportunity emails' do
      VCR.use_cassette('get_opportunity_emails') do
        emails = client.get_opportunity_emails(opportunity_id)
        expect(emails).to be_a(Array)
        expect(emails.first).to be_a(Email)
      end
    end
  end

  # GET /v2.1/Opportunities/{c_id}/Image
  # describe '#get_opportunity_image' do
  #   it 'returns an opportunity image' do
  #     VCR.use_cassette('get_opportunity_image') do
  #       response = client.get_opportunity_image(opportunity_id)
  #       #expect(response.status).to eq(200)
  #       # TODO - Insightly server error with default opportunity image they should fix this.
  #     end
  #   end
  # end

  # GET /v2.1/Opportunities/{c_id}/Notes
  describe '#get_opportunity_notes' do
    it 'returns an opportunity notes' do
      VCR.use_cassette('get_opportunity_notes') do
        notes = client.get_opportunity_notes(opportunity_id)
        expect(notes).to be_a(Array)
        expect(notes.first).to be_a(Note)
      end
    end
  end

  # GET /v2.1/Opportunities/{c_id}/StateHistory
  # describe '#get_opportunity_state_history' do
  #   it 'returns an opportunity state history' do
  #     VCR.use_cassette('get_opportunity_state_history') do
  #       state_history = client.get_opportunity_state_history(opportunity_id)
  #       #expect(state_history).to be_a(Array)
  #       #expect(state_history.first).to be_a(OpportunityStateReason)
  #       # TODO - Insightly server error with state history?
  #     end
  #   end
  # end

  # GET /v2.1/Opportunities/{c_id}/Tasks
  describe '#get_opportunity_tasks' do
    it 'returns an opportunity tasks' do
      VCR.use_cassette('get_opportunity_tasks') do
        tasks = client.get_opportunity_tasks(opportunity_id)
        expect(tasks).to be_a(Array)
        expect(tasks.first).to be_a(Task)
      end
    end
  end

  # GET /v2.1/Opportunities?ids={ids}&tag={tag}
  describe '#get_opportunities' do
    it 'returns an array of opportunities' do
      VCR.use_cassette('get_opportunities') do
        opportunities = client.get_opportunities
        expect(opportunities).to be_a(Array)
        expect(opportunities.first).to be_a(Opportunity)
      end
    end
  end

  # POST /v2.1/Opportunities
  describe '#create_opportunity' do
    it 'creates and returns an opportunity' do
      VCR.use_cassette('create_opportunity') do
        opportunity = client.get_opportunity(opportunity_id)
        expect(client.create_opportunity(opportunity)).to be_a(Opportunity)
      end
    end
  end

  # POST /v2.1/Opportunities/{c_id}/Image/{filename}
  # describe '#create_opportunity_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('create_opportunity_image') do
  #       response = client.create_opportunity_image(opportunity_id, filename: '1.jpg')
  #       #expect(response.status).to eq(201)
  #       # TODO - Can't add image. Not sure why.
  #     end
  #   end
  # end

  # PUT /v2.1/Opportunities
  describe '#update_opportunities' do
    it 'updates and returns an opportunity' do
      VCR.use_cassette('update_opportunity') do
        opportunity = client.get_opportunity(opportunity_id)
        expect(client.update_opportunity(opportunity)).to be_a(Opportunity)
      end
    end
  end

  # PUT /v2.1/Opportunities/{c_id}/Image/{filename}
  # describe '#update_opportunity_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('update_opportunity_image') do
  #       response = client.update_opportunity_image(opportunity_id, filename: '1.jpg')
  #       # TODO - Can't add image. Not sure why.
  #       # expect(response.status).to eq(201)
  #     end
  #   end
  # end

  # DELETE /v2.1/Opportunities/{id}
  describe '#delete_opportunity' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_opportunity') do
        response = client.delete_opportunity(opportunity_id)
        expect(response.status).to eq(202)
      end
    end
  end

  # DELETE /v2.1/Opportunities/{c_id}/Image
  describe '#delete_opportunity_image' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_opportunity_image') do
        response = client.delete_opportunity_image(opportunity_id)
        expect(response.status).to eq(202)
      end
    end
  end
end
