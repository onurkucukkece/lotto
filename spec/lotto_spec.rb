RSpec.describe Lotto do
  it "has a version number" do
    expect(Lotto::VERSION).not_to be nil
  end

  it "should pick specified amount of number from specified range" do
    lotto = Lotto::Draw.new
    expect(lotto.play({ pick: 6, of: 49 }).length).to eq(6)
    100.times{ expect(lotto.play({ pick: 6, of: 49 }).sort.last).to be <= 49 }
  end

  it "should generate multilpe lotto columns" do
    lotto = Lotto::Draw.new
    columns = lotto.play({ pick: 6, of: 49, for: 5 })
    expect(columns.length).to eq(5)
    columns.each{ |col| expect(col.length).to eq(6) }
  end
end
