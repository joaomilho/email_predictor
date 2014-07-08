class String
  def initial
    self[0, 1]
  end

  def initial?
    self == initial
  end

  def full?
    ! initial?
  end
end
