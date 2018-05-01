RSpec.describe Lotto do
  it 'has a version number' do
    expect(Lotto::VERSION).not_to be nil
  end

  describe 'Draw' do
    let(:lotto) { Lotto::Draw.new }
    describe '#play' do
      it 'should pick specified amount of number from specified range' do
        expect(lotto.play(pick: 6, of: 49).length).to eq(6)
      end

      100.times do
        it 'should pick a number once' do
          expect(lotto.play(pick: 6, of: 49).uniq.length).to eq 6
        end

        it 'should pick within correct range' do
          expect(lotto.play(pick: 6, of: 49).max).to be <= 49
        end
      end
    end

    describe '#play' do
      let(:columns) { lotto.play(pick: 6, of: 49, for: 5) }
      it 'should generate multilpe lotto columns' do
        expect(columns.length).to eq(5)
      end

      it 'should pick a number once in a colum' do
        columns.each { |col| expect(col.uniq.length).to eq(6) }
      end
    end
  end
end
