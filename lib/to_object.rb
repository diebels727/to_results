require "to_object/version"
require 'active_support/core_ext'

class Hash

  def to_object
    hash = inject([]) do |hash,as_array|
      key = as_array.shift
      value = as_array.pop

      camel_key = key.to_s.camelize
      key = Struct.new(camel_key,value).new
      key.value = value

      value.is_a?(Hash) && (value=value.to_object)

      hash << key
    end
  end

end
