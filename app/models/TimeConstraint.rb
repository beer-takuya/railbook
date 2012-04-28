class TimeConstrait
  def matches?(request)
    current = Time.now
    echo current
    current.hour >= 13 && current.hour < 19
  end
end