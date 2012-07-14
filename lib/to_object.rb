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

  def json
    @json ||= []
  end

  def build( hash )
    self.json << hash
    hash.each_pair do |key,value|
      key = sanitize_key(key)

      if value.is_a? Hash
        camel_key = key.camelize

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
        singular_key = key.singularize

        value.each do |value|
          struct = make_struct_instance singular_key.camelize
          struct.build(value)
          send(key) << struct
        end
      end
    end

  rescue Exception => e
    self.errors << { e.message => hash }
  end

private

  def sanitize_key( key )
    key.to_s.downcase.gsub(/[^0-9a-z]/i,'_')
  end

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
