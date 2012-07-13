require 'spec_helper'

describe Hash do

  context 'when the hash value is a hash' do

    it 'converts the key in to a struct' do
      hash = { :key => {} }.to_object
      key = hash.keys.first
      key.should be Struct::Key
    end

  end


end