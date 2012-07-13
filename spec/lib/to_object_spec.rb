require 'spec_helper'

describe Hash do
  let(:parsed_json) { JSON.parse json }
  let(:simple_json) { {:total => 1} }

  context 'to_results' do
    it 'returns a result' do
      results = simple_json.to_results
      results.should be_instance_of Results
    end

    it 'assigns base-level key-value pairs as attributes' do
      results = simple_json.to_results
      results.total.should be 1
    end



  end

end