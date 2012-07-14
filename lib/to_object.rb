require "to_object/version"
require "active_support/core_ext"

class Results
  attr_reader :json

  def initialize(*args,&block)
    @json = args.first
    build
  end

  def build
    json.each_pair do |key,value|
      eigenclass.instance_eval { attr_accessor key }
      send "#{key}=",value
    end

  end

private
  def eigenclass
    class << self
      self
    end
  end


end

class Hash

  def to_results
    Results.new(self)
  end

end
