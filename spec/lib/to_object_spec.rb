require 'spec_helper'

describe Hash do
  let(:simple_hash) { {:key => :value} }

  it 'creates an array' do
    objects = simple_hash.to_object
    objects.class.should be Array
  end

  it 'converts key-value pairs in to objects' do
    objects = simple_hash.to_object
    object = objects.first
    object.should be_instance_of Struct::Key
  end

  it 'converts a key value pair in to an object, where the key is the class name, and the value is an attribute' do
    objects = simple_hash.to_object
    object = objects.first
    object.value.should be :value
  end

  it 'converts multiple keys in to multiple objects' do
    objects = { :key_one => :value, :key_two => :value }.to_object
    objects.map! do |object|
      klass = object.class
      superclass = klass.superclass
      superclass == Struct
    end

    objects.include?(false).should_not be true
  end

  context 'when the hash value is a hash' do

    it 'converts the key in to a struct' do
      objects = { :key => {} }.to_object
      object = objects.first
      object.should be_instance_of Struct::Key
    end

    it 'converts values that have hashes in to structs' do
      hash = { :key => { :key => :value } }.to_object
      value = hash.values.first
      key   = value.keys.first
      key.should be Struct::Key
    end

  end


end