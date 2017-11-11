class Version

  def initialize(major, minor, patch)
    check_param(:major, major)
    check_param(:minor, minor)
    check_param(:patch, patch)

    @major = major
    @minor = minor
    @patch = patch
  end

  def number
    "#{@major}.#{@minor}.#{@patch}"
  end

  def ==(other)
    number == other.number
  end

  def check_param(key, value)
    raise ArgumentError.new("#{key}は不正な値です。") unless value.kind_of?(Integer) && value >= 0
  end

end
