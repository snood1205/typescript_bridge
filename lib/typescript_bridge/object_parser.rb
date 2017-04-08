class ObjectParser
  attr_accessor :class, :object

  def initialize(stringified_object)
    @object = JSON.parse(stringified_object)
    @class = @object.class
  rescue JSON::ParserError
    @object = nil
    @class = NilClass
  end
end
