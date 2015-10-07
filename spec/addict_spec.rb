require 'spec_helper'

describe Addict do
  it { should have_many(:relapses) }

  it("validates presence of name") do
    addict = Addict.new({:name => ''})
    expect(addict.save()).to(eq(false))

  end
end
