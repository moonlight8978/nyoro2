class ModelStatusValue
  attr_reader :marked

  def initialize(marked)
    @marked = marked
  end

  def to_s
    waiting_for_destroy_confirmation? ? 'pending' : 'active'
  end

  def css_class
    waiting_for_destroy_confirmation? ? 'destroy' : 'create'
  end

private

  def waiting_for_destroy_confirmation?
    @marked
  end
end
