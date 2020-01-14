# typed: false
# frozen_string_literal: true

describe Array do
  let(:sample_1) { ['', 1, '', Object.new, :a] }
  let(:sample_2) { ['a', 1, 'b', Object.new, :a] }
  let(:sample_3) { ['X', 'X', ''] }
  let(:sample_4) { %w[A] * 3 }

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

describe String do
  let(:string)   { 'Hello, my name is Zaid' }

  context '#red' do
    it 'colours the string with red' do
      expect(string.red).to eq "\e[0;31;49mHello, my name is Zaid\e[0m"
    end
  end
  context '#yellow' do
    it 'colours the string with yellow' do
      expect(string.yellow).to eq "\e[0;33;49mHello, my name is Zaid\e[0m"
    end
  end
  context '#blue' do
    it 'colours the string with blue' do
      expect(string.blue).to eq "\e[0;34;49mHello, my name is Zaid\e[0m"
    end
  end
  context '#green' do
    it 'colours the string with green' do
      expect(string.green).to eq "\e[0;32;49m#{string}\e[0m"
    end
  end
  context '#light_yellow' do
    it 'colours the string with light yellow' do
      expect(string.light_yellow).to eq "\e[0;93;49m#{string}\e[0m"
    end
  end
  context '#back_light_blue' do
    it 'colours the strings background with light blue' do
      expect(string.back_light_blue).to eq "\e[0;39;104m#{string}\e[0m"
    end
  end
end
