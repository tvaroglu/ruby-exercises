class Student
  attr_accessor :grade, :study_counter

  def initialize()
    @grade = 'C'
    @study_counter = 0
  end

  def study_count?()
    return self.study_counter
  end

  def current_grade?()
    if study_count?() == 0
      self.grade = 'C'
    elsif study_count?() == 1
      self.grade = 'B'
    elsif study_count?() >= 2
      self.grade = 'A'
    elsif study_count?() == -1
      self.grade = 'D'
    elsif study_count?() <= -2
      self.grade = 'F'
    end
    return self.grade
  end

  def study()
    self.study_counter += 1
    if study_count?() <= -2
      self.study_counter = -1
    end
    return current_grade?()
  end

  def slack_off()
    self.study_counter -= 1
    if study_count?() >= 2
      self.study_counter = 1
    end
    return current_grade?()
  end

end
