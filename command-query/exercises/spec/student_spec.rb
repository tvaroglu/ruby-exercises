require 'rspec'
require_relative '../lib/student'

RSpec.describe Student do
  it 'has a mediocre grade' do
    student = Student.new

    expect(student.grade).to eq('C')
  end

  it 'can improve its grade' do
    student = Student.new
    expect(student.grade).to eq('C')

    student.study
    expect(student.grade).to eq('B')

    student.study
    expect(student.grade).to eq('A')
  end

  it 'can only get so good' do
    student = Student.new
    expect(student.grade).to eq('C')

    3.times { student.study }
    expect(student.grade).to eq('A')
  end

  it 'can get worse' do
    student = Student.new
    expect(student.grade).to eq('C')

    student.slack_off
    expect(student.grade).to eq('D')

    student.slack_off
    expect(student.grade).to eq('F')

    student.study
    expect(student.current_grade?).to eq('D')

    student.slack_off
    expect(student.current_grade?).to eq('F')

    student.slack_off
    expect(student.current_grade?).to eq('F')

    student.study
    expect(student.current_grade?).to eq('D')

    student.study
    expect(student.current_grade?).to eq('C')

    student.study
    expect(student.current_grade?).to eq('B')

    student.study
    expect(student.current_grade?).to eq('A')

    student.study
    expect(student.current_grade?).to eq('A')

    student.slack_off
    expect(student.current_grade?).to eq('B')

    student.slack_off
    expect(student.current_grade?).to eq('C')
  end

  it 'can only get so worse' do
    student = Student.new

    100.times { student.slack_off }
    expect(student.grade).to eq('F')
  end

  it 'slacking off is immediately noticable' do
    student = Student.new
    expect(student.current_grade?).to eq('C')
    expect(student.study_count?).to eq(0)

    100.times { student.study }
    expect(student.current_grade?).to eq('A')
    expect(student.study_count?).to eq(100)

    student.slack_off
    expect(student.current_grade?).to eq('B')
    expect(student.study_counter).to eq(1)
  end

  it 'however, so is studying' do
    student = Student.new
    expect(student.current_grade?).to eq('C')
    expect(student.study_count?).to eq(0)

    100.times { student.slack_off }
    expect(student.current_grade?).to eq('F')
    expect(student.study_count?).to eq(-100)

    student.study
    expect(student.current_grade?).to eq('D')
    expect(student.study_count?).to eq(-1)
  end
end
