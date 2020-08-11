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
  let(:num_array_test_block) { proc { |value| value.even? } }
  let(:str_hash_test_block) do
    proc { |key, value|
      p key
      p value
    }
  end

  describe '#my_each with num array' do
    it 'return matches that of #each enumerable with numeric array' do
      expect(num_array.my_each { num_array_test_block }).to eql(num_array.each { num_array_test_block })
    end
  end

  describe '#my_each with str hash' do
    it 'return matches that of #each enumerable with string hash' do
      expect(str_hash.my_each { str_hash_test_block }).to eql(str_hash.each { str_hash_test_block })
    end
  end

  #
  # describe '#my_each_with_index' do
  #   it 'return matches that of #each_with_index enumerable with numeric array' do
  #     expect(num_array.my_each_with_index { num_array_test_block }).to eql(num_array.each_with_index { num_array_test_block })
  #   end
  # end
  #
  # describe '#my_select' do
  #   it 'return matches that of #select enumerable with numeric array' do
  #     expect(num_array.my_select { num_array_test_block }).to eql(num_array.select { num_array_test_block })
  #   end
  # end
  #
  # describe '#my_all?' do
  #   it 'return matches that of #all? enumerable with numeric array' do
  #     expect(num_array.my_all? { num_array_test_block }).to eql(num_array.all? { num_array_test_block })
  #   end
  # end
  #
  # describe '#my_any?' do
  #   it 'return matches that of #any? enumerable with numeric array' do
  #     expect(num_array.my_any? { num_array_test_block }).to eql(num_array.any? { num_array_test_block })
  #   end
  # end
  #
  # describe '#my_none?' do
  #   it 'return matches that of #none? enumerable with numeric array' do
  #     expect(num_array.my_none? { num_array_test_block }).to eql(num_array.none? { num_array_test_block })
  #   end
  # end
  #
  # describe '#my_count' do
  #   it 'return matches that of #count enumerable with numeric array' do
  #     expect(num_array.my_count { num_array_test_block }).to eql(num_array.count { num_array_test_block })
  #   end
  # end
  #
  # describe '#my_map' do
  #   it 'return matches that of #map enumerable with numeric array' do
  #     expect(num_array.my_map { num_array_test_block }).to eql(num_array.map { num_array_test_block })
  #   end
  # end
  #
  # describe '#my_inject' do
  #   it 'return matches that of #inject enumerable with numeric array' do
  #     expect(num_array.my_inject { num_array_test_block }).to eql(num_array.inject { num_array_test_block })
  #   end
  # end
end
