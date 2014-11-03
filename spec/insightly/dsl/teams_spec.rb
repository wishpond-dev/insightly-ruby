require 'spec_helper'

describe Insightly::DSL::Teams do
  let(:team_id) { 2063767 }

  # GET /v2.1/Teams/{id}
  describe '#get_team' do
    it 'returns a team' do
      VCR.use_cassette('get_team') do
        expect(client.get_team(team_id)).to be_a(Team)
      end
    end
  end

  # GET /v2.1/Teams
  describe '#get_teams' do
    it 'returns an array of teams' do
      VCR.use_cassette('get_teams') do
        teams = client.get_teams
        expect(teams).to be_a(Array)
        expect(teams.first).to be_a(Team)
      end
    end
  end

  # POST /v2.1/Teams
  describe '#create_team' do
    it 'creates and returns a team' do
      VCR.use_cassette('create_team') do
        team = client.get_team(team_id)
        expect(client.create_team(team)).to be_a(Team)
      end
    end
  end

  # PUT /v2.1/Teams
  describe '#update_team' do
    it 'updates and returns a team' do
      VCR.use_cassette('update_team') do
        team = client.get_team(team_id)
        expect(client.update_team(team)).to be_a(Team)
      end
    end
  end

  # DELETE /v2.1/Teams/{id}
  describe '#delete_team' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_team') do
        response = client.delete_team(team_id)
        expect(response.status).to eq(202)
      end
    end
  end
end
