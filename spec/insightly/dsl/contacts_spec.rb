require 'spec_helper'

describe Insightly::DSL::Contacts do
  let(:contact_id) { 70653019 }

  # GET /v2.1/Contacts/{id}
  describe '#get_contact' do
    it 'returns a contact' do
      VCR.use_cassette('get_contact') do
        expect(client.get_contact(contact_id)).to be_a(Contact)
      end
    end
  end

  # GET /v2.1/Contacts/{c_id}/Emails
  describe '#get_contact_emails' do
    it 'returns a contacts emails' do
      VCR.use_cassette('get_contact_emails') do
        emails = client.get_contact_emails(contact_id)
        expect(emails).to be_a(Array)
        expect(emails.first).to be_a(Email)
      end
    end
  end

  # GET /v2.1/Contacts/{c_id}/Notes
  describe '#get_contact_notes' do
    it 'returns a contacts notes' do
      VCR.use_cassette('get_contact_notes') do
        notes = client.get_contact_notes(contact_id)
        expect(notes).to be_a(Array)
        expect(notes.first).to be_a(Note)
      end
    end
  end

  # GET /v2.1/Contacts/{c_id}/Tasks
  describe '#get_contact_tasks' do
    it 'returns a contacts tasks' do
      VCR.use_cassette('get_contact_tasks') do
        tasks = client.get_contact_tasks(contact_id)
        expect(tasks).to be_a(Array)
        expect(tasks.first).to be_a(Task)
      end
    end
  end

  # GET /v2.1/Contacts/{c_id}/Image
  # describe '#get_contact_image' do
  #   it 'returns a contacts image' do
  #     VCR.use_cassette('get_contact_image') do
  #       response = client.get_contact_image(contact_id)
  #       # expect(response.status).to eq(200)
  #       # TODO - Insightly server error with default contact image they should fix this.
  #     end
  #   end
  # end

  # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}
  describe '#get_contacts' do
    it 'returns an array of contacts' do
      VCR.use_cassette('get_contacts') do
        contacts = client.get_contacts
        expect(contacts).to be_a(Array)
        expect(contacts.first).to be_a(Contact)
      end
    end
  end

  # POST /v2.1/Contacts
  describe '#create_contact' do
    it 'creates and returns contact' do
      VCR.use_cassette('create_contact') do
        expect(client.create_contact({first_name: 'Shark', last_name: 'Nado'})).to be_a(Contact)
      end
    end
  end

  # POST /v2.1/Contacts/{c_id}/Image/{filename}
  # describe '#create_contact_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('create_contact_image') do
  #       response = client.create_contact_image(contact_id, filename: '1.jpg')
  #       # expect(response.status).to eq(201)
  #       # TODO - Can't add image. Not sure why.
  #     end
  #   end
  # end

  # PUT /v2.1/Contacts
  describe '#update_contact' do
    it 'updates and returns contact' do
      VCR.use_cassette('update_contact') do
        contact = client.get_contact(contact_id)
        expect(client.update_contact(contact)).to be_a(Contact)
      end
    end
  end

  # PUT /v2.1/Contacts/{c_id}/Image/{filename}
  # describe '#update_contact_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('update_contact_image') do
  #       response = client.update_contact_image(contact_id, filename: '1.jpg')
  #       # expect(response.status).to eq(201)
  #       # TODO - Can't update image. Not sure why.
  #     end
  #   end
  # end

  # DELETE /v2.1/Contacts/{id}
  describe '#delete_contact' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_contact') do
        response = client.delete_contact(contact_id)
        expect(response.status).to eq(202)
      end
    end
  end

  # DELETE /v2.1/Contacts/{c_id}/Image
  describe '#delete_contact_image' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_contact_image') do
        response = client.delete_contact_image(contact_id)
        expect(response.status).to eq(202)
      end
    end
  end
end
