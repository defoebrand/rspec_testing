# spec/enumerable_test.rb

require './bin/enumerables'

describe Enumerable do
  let(:calculator) { Calculator.new }
  let(:empty_array) { [] }
  let(:empty_hash) { {} }
  let(:rand_array) { [5, 4, 3, 2, 1, 'hello', 'world'] }
  let(:num_array) { [9, 8, 7, 6, 2, 3, 4, 5] }
  let(:str_array) { %w[Larry Curly Moe] }
  let(:str_hash) { { 'name' => 'Bob', 'phone' => '111-111-1111' } }
  let(:num_hash) { { apples: 10, oranges: 5, bananas: 1 } }
  let(:test_block) { proc { |value| value.even? } }

  describe '#my_each' do
    it 'return matches that of #each enumerable' do
      expect(num_array.my_each { test_block }).to eql(num_array.each { test_block })
    end
  end

  describe '#my_each_with_index' do
    it 'return matches that of #each_with_index enumerable' do
      expect(num_array.my_each_with_index { test_block }).to eql(num_array.each_with_index { test_block })
    end
  end

  describe '#my_select' do
    it 'return matches that of #select enumerable' do
      expect(num_array.my_select { test_block }).to eql(num_array.select { test_block })
    end
  end

  describe '#my_all?' do
    it 'return matches that of #all? enumerable' do
      expect(num_array.my_all? { test_block }).to eql(num_array.all? { test_block })
    end
  end

  describe '#my_any?' do
    it 'return matches that of #any? enumerable' do
      expect(num_array.my_any? { test_block }).to eql(num_array.any? { test_block })
    end
  end

  describe '#my_none?' do
    it 'return matches that of #none? enumerable' do
      expect(num_array.my_none? { test_block }).to eql(num_array.none? { test_block })
    end
  end

  describe '#my_count' do
    it 'return matches that of #count enumerable' do
      expect(num_array.my_count { test_block }).to eql(num_array.count { test_block })
    end
  end

  describe '#my_map' do
    it 'return matches that of #map enumerable' do
      expect(num_array.my_map { test_block }).to eql(num_array.map { test_block })
    end
  end

  describe '#my_inject' do
    it 'return matches that of #inject enumerable' do
      expect(num_array.my_inject { test_block }).to eql(num_array.inject { test_block })
    end
  end
end
