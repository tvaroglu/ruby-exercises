class Santa
  attr_accessor :fits, :cookies_eaten

  def initialize()
    @fits = true
    @cookies_eaten = 0
  end

  def fits?()
    return self.fits
  end

  def eats_cookies
    self.cookies_eaten += 1
    if self.cookies_eaten >= 3
      self.fits = false
    end
  end

end
