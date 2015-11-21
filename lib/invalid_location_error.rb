class InvalidLocationError < StandardError
  def initialize(location)
    super "Car2Go probably doesn't like the city you entered: #{location}"
  end
end
