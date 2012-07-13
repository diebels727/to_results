require "to_object/version"
require "active_support/core_ext"

class Results


end

class Hash

  def to_results
    Results.new

  end

end
