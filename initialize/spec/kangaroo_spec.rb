require 'rspec'
require_relative '../lib/kangaroo'

RSpec.describe Kangaroo do
  it 'exists' do
    kerrie = Kangaroo.new("Kerrie", ["Kat", "Kyle"])

    expect(kerrie).to be_an_instance_of(Kangaroo)
  end

  it 'has children' do
    kerrie = Kangaroo.new("Kerrie", ["Kat", "Kyle"])

    expect(kerrie.children).to eq(["Kat", "Kyle"])
  end

  it 'can accept multiple data types as the children parameter' do
    jack = Kangaroo.new
    expect(jack.name).to eq('Jack')
    expect(jack.children).to eq(['Joey'])

    kangaroo = Kangaroo.new('Rudy', ['Kat','Kyle','Jim'])
    expect(kangaroo.children).to eq(['Kat', 'Kyle', 'Jim'])

    kang = Kangaroo.new('Rudy', 'Kat, Kyle, Jim')
    expect(kang.children).to eq(['Kat', 'Kyle', 'Jim'])

    a = Kangaroo.new('Rudy', 'Kat Kyle Jim')
    expect(a.children).to eq(['Kat', 'Kyle', 'Jim'])

    roo = Kangaroo.new('Rudy', ['Kat Kyle Jim'])
    expect(roo.children).to eq(['Kat', 'Kyle', 'Jim'])
  end
end
