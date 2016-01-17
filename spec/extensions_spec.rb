describe Array do
  let(:sample_1) { ['', 1, '', Object.new, :a] }
  let(:sample_2) { ['a', 1, 'b', Object.new, :a] }
  let(:sample_3) { ['X', 'X', ''] }
  let(:sample_4) { %w(A) * 3 }

  context '#all_empty?' do
    it 'returns true if all elements of the Array are empty' do
      expect(['', '', ''].all_empty?).to be true
    end

    it 'returns false if some of the Array elements are not empty' do
      expect(sample_1.all_empty?).to be false
    end

    it 'returns true for an empty Array' do
      expect([].all_empty?).to be true
    end
  end

  context '#all_same?' do
    it 'returns true if all elements of the Array are the same' do
      expect(sample_4.all_same?).to be true
    end

    it 'returns false if some of the Array elements are not the same' do
      expect(sample_1.all_same?).to be false
    end

    it 'returns true for an empty Array' do
      expect([].all_same?).to be true
    end
  end

  context '#any_empty' do
    it 'returns true if any elements of the Array are empty' do
      expect(sample_3.any_empty?).to be true
    end

    it 'returns false if none of the Array elements are not empty' do
      expect(sample_2.any_empty?).to be false
    end
  end

  context '#none_empty?' do
    it 'returns false if any elements of the Array are empty' do
      expect(sample_3.none_empty?).to be false
    end

    it 'returns true if none of the Array elements are not empty' do
      expect(sample_2.none_empty?).to be true
    end
  end
end
