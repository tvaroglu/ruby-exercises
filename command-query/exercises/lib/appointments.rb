class Appointments
  attr_accessor :appointments

  def initialize()
    @appointments = Array.new
  end

  def at(time)
    if time.class == Time
      appointments << time
    end
  end

  def earliest()
    return self.appointments.min_by do |appointment|
      appointment.to_i
    end
  end

  def latest()
    return self.appointments.max_by do |appointment|
      appointment.to_i
    end
  end

end
