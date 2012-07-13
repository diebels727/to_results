require 'spec_helper'

describe Hash do

  it 'converts keys in to a struct' do
    hash = { :key => :value }.to_object
    key = hash.keys.first
    key.should be Struct::Key
  end

  context 'when the hash value is a hash' do

    it 'converts the key in to a struct' do
      hash = { :key => {} }.to_object
      key = hash.keys.first
      key.should be Struct::Key
    end

    it 'converts values that have hashes in to structs' do
      hash = { :key => { :key => :value } }.to_object
      value = hash.values.first
      key   = value.keys.first
      key.should be Struct::Key
    end

  end


end