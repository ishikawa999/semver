class Version

  def initialize(major, minor, patch)
    @major = major
    @minor = minor
    @patch = patch
  end

  def number
    "#{@major}.#{@minor}.#{@patch}"
  end

  def ==(version)
    number == version.number
  end
end
