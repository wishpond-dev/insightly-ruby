require 'spec_helper'

describe Insightly::Resources::CustomField do
  subject(:custom_field) do
    VCR.use_cassette('get_custom_field') do
      client.get_custom_field('CONTACT_FIELD_1')
    end
  end

  describe 'instance' do
    it 'is decorated with CustomField object' do
      expect(subject).to be_a(described_class)
    end

    %w(custom_field_id order_id field_for field_name field_type field_help_text
       default_value group_id custom_field_options).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end
