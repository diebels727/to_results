require 'spec_helper'

describe Hash do
  let(:parsed_json) { JSON.parse json }
  let(:simple_json) { {:total => 1} }

  context 'to_results' do
    it 'returns a result' do
      results = simple_json.to_results
      results.should be_instance_of Results
    end
  end
end

describe Results do
  let(:parsed_json) { JSON.parse json }
  let(:value_json) { {:total => 1} }
  let(:hash_json) { {:span => { :left => true,:right => false}} }
  let(:array_json) { { :businesses => [ {:business_one_attribute => 'timewriter'},
                                               {:business_two_attribute => 'sven vaeth'} ] } }

  it 'assigns key-value pairs as attributes' do
    results = Results.new value_json
    results.total.should be 1
  end

  it 'builds objects for values that are hashes' do
    results = Results.new hash_json
    results.span.should be_instance_of Struct::Span
  end

  context 'when the value is an array' do
    it 'builds arrays of objects' do
      results = Results.new array_json
      business = results.businesses.first
      business.should be_instance_of Struct::Business
    end

  end


end