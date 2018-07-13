RSpec.describe Lotto do
  it "has a version number" do
    expect(Lotto::VERSION).not_to be nil
  end

  describe 'Draw' do
    let(:lotto) { Lotto::Draw.new }
    describe '#play' do
      it "should pick specified amount of number from specified range" do
        expect(lotto.play({ pick: 6, of: 49 }).length).to eq(6)
      end

      it 'should pick a number once' do
        100.times do
          column = lotto.play({ pick: 6, of: 49 })
          expect(column.uniq.length).to eq 6
        end
      end

      it 'should pick within correct range' do
        100.times do
          column = lotto.play({ pick: 6, of: 49 })
          expect(column.sort.last).to be <= 49
        end
      end
    end

    describe '#play' do
      let(:columns) { lotto.play({ pick: 6, of: 49, for: 5 }) }
      it "should generate multilpe lotto columns" do
        expect(columns.length).to eq(5)
      end

      it 'should pick a number once in a colum' do
        columns.each{ |col| expect(col.uniq.length).to eq(6) }
      end
    end

    describe '#play' do
      it 'should exclude specified numbers' do
        expect(lotto.play(pick: 6, of: 8, exclude: [7, 8])).not_to include(7)
        expect(lotto.play(pick: 6, of: 8, exclude: [7, 8])).not_to include(8)
      end
    end

    describe '#play' do
      let(:columns) { lotto.play({ pick: 6, of: 10, exclude: [1, 9], for: 10 }) }
      it "should exclude specified numbers in all draws" do
        columns.each{ |col|
          expect(col).not_to include(1)
          expect(col).not_to include(9)

    describe '#play' do
      let(:columns) { lotto.play({ pick: 6, of: 20, include: [1, 9], for: 5 }) }
      it "should include specified numbers in all draws" do
        columns.each{ |col|
          expect(col).to include(1)
          expect(col).to include(9)
          expect(col.count).to eq 6
         }
      end
    end

    describe '#play' do
      let(:columns) { lotto.play({ pick: 6, of: 30, include: [1, 9], exclude: [2, 10], for: 5 }) }
      it "should include and exclude specified numbers in all draws" do
        columns.each{ |col|
          expect(col).to include(1)
          expect(col).to include(9)
          expect(col).not_to include(2)
          expect(col).not_to include(10)
          expect(col.count).to eq 6
         }
      end
    end
  end
end
