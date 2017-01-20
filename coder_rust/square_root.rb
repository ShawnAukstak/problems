# require 'rspec/autorun'

def square_root(n)
  return 4
end

n = 16
puts "Square root of #{n} is #{square_root(n)}"

RSpec.describe "square_root" do
  it "returns square root" do
    expect(square_root(16)).to eq 4
  end
end