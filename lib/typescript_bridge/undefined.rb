class Undefined < NilClass

  def method_missing(*args)
    super if respond_to_missing?(args)
  end

  def respond_to_missing?(*args)
    super(args)
  end

  def to_s
    'undefined'
  end
end
