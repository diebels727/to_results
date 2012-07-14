require "to_object/version"
require "active_support/core_ext"

module Builder

  def build( hash )
    hash.each_pair do |key,value|
      if value.is_a?(Hash)
        camel_key = key.to_s.camelize
        struct = Struct.new(camel_key).new
        struct.extend Builder
        struct.build(value)
        value = struct
      end

      singleton_class.instance_eval { attr_accessor key }
      send "#{key}=",value
    end
  end

end

class Results
  include Builder

  def initialize(*args,&block)
    hash = args.first
    build hash
  end

end

class Hash

  def to_results
    Results.new(self)
  end

end
