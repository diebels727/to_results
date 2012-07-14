require "to_object/version"
require "active_support/core_ext"

module Builder

  def errors
    @errors ||= []
  end

  def valid?
    errors.blank?
  end

  def invalid?
    !valid?
  end

  def entries
    @entries ||= []
  end

  def build( hash )
    self.entries << hash
    hash.each_pair do |key,value|

      if value.is_a? Hash
        camel_key = key.to_s.camelize
        struct = make_struct_instance camel_key
        struct.build(value)
        value = struct
      end

      singleton_class.instance_eval do
         attr_accessor key
       end
      send "#{key}=",value

      if value.is_a? Array
        send "#{key}=",[]
        singular_key = key.to_s.singularize
        value.each do |value|
          struct = make_struct_instance singular_key.camelize
          struct.build(value)
          send(key) << struct
        end
      end
    end

  rescue
    self.errors << { :unprocessable => hash }
  end

private

  def make_struct_instance( camelized_key )
    klass = Struct.const_defined?(camelized_key) ? Struct.const_get(camelized_key) : Struct.new(camelized_key)
    struct = klass.new
    struct.extend Builder
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
