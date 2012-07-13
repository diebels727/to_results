require 'spec_helper'

describe Hash do
  let(:parsed_json) { JSON.parse json }
  let(:simple_json) { {:total => 1} }

  context 'to_object' do
    it 'returns an array' do
      objects = simple_json.to_object
      objects.should be_instance_of Array
    end



  end

end