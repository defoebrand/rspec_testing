# spec/enumerable_test.rb

require './bin/enumerables'

describe Enumerable do
  let(:empty_array) { [] }
  let(:num_array) { [9, 8, 7, 6, 2, 3, 4, 5] }
  let(:str_array) { %w[Larry Curly Moe] }
  let(:str_hash) { { 'name' => 'Bob', 'phone' => '111-111-1111' } }
  let(:num_array_test_block) { proc { |value| value.even? } }
  let(:num_array_ind_test_block) { proc { |num, ind| "#{num}: #{ind}" } }
  let(:str_hash_test_block) do
    proc { |key, value|
      p key
      p value
    }
  end
  let(:select_test_block) { proc { |x| x > 2 } }
  let(:select_hash_test_block) { proc { |_k, v| v == 'Bob' } }
  let(:str_test_block) { proc { |word| word.length >= 3 } }
  let(:multiply_test_block) { proc { |i| i * i } }
  let(:inject_test_block) { proc { |product, n| product * n } }

  describe '#my_each' do
    it 'return matches that of #each enumerable with numeric array' do
      expect(num_array.my_each { num_array_test_block }).to eql(num_array.each { num_array_test_block })
    end

    it 'return matches that of #each enumerable with string hash' do
      expect(str_hash.my_each { str_hash_test_block }).to eql(str_hash.each { str_hash_test_block })
    end
  end

  describe '#my_each_with_index' do
    it 'return matches that of #each_with_index enumerable with numeric array' do
      expect(num_array.my_each_with_index do
               num_array_test_block
             end).to eql(num_array.each_with_index { num_array_test_block })
    end

    it 'return matches that of #each_with_index enumerable with numeric array plus index' do
      expect(num_array.my_each_with_index do
               num_array_ind_test_block
             end).to eql(num_array.each_with_index { num_array_ind_test_block })
    end

    it 'return matches that of #each enumerable with string hash' do
      expect(str_hash.my_each_with_index do
               str_hash_test_block
             end).to eql(str_hash.each_with_index { str_hash_test_block })
    end
  end

  describe '#my_select' do
    it 'return matches that of #select enumerable with numeric array' do
      expect(num_array.my_select { select_test_block }).to eql(num_array.select { select_test_block })
    end

    it 'return matches that of #select enumerable with str hash' do
      expect(str_hash.my_select { select_hash_test_block }).to eql(str_hash.select { select_hash_test_block })
    end
  end

  describe '#my_all?' do
    it 'return matches that of #all? enumerable with numeric array' do
      expect(num_array.my_all? { num_array_test_block }).to eql(num_array.all? { num_array_test_block })
    end

    it 'return matches that of #all? enumerable with str array' do
      expect(str_array.my_all? { str_test_block }).to eql(str_array.all? { str_test_block })
    end

    it 'return matches that of #all? enumerable with an empty array' do
      expect(empty_array.my_all?).to eql(empty_array.all?)
    end
  end

  describe '#my_any?' do
    it 'return matches that of #any? enumerable with numeric array' do
      expect(num_array.my_any? { num_array_test_block }).to eql(num_array.any? { num_array_test_block })
    end

    it 'return matches that of #any? enumerable with str array' do
      expect(str_array.my_any? { str_test_block }).to eql(str_array.any? { str_test_block })
    end

    it 'return matches that of #any? enumerable with an empty array' do
      expect(empty_array.my_any?).to eql(empty_array.any?)
    end
  end

  describe '#my_none?' do
    it 'return matches that of #none? enumerable with numeric array' do
      expect(num_array.my_none? { num_array_test_block }).to eql(num_array.none? { num_array_test_block })
    end

    it 'return matches that of #none? enumerable with str array' do
      expect(str_array.my_none? { str_test_block }).to eql(str_array.none? { str_test_block })
    end

    it 'return matches that of #none? enumerable with an empty array' do
      expect(empty_array.my_none?).to eql(empty_array.none?)
    end
  end

  describe '#my_count' do
    it 'return matches that of #count enumerable with numeric array' do
      expect(num_array.my_count { num_array_test_block }).to eql(num_array.count { num_array_test_block })
    end
  end

  describe '#my_map' do
    it 'return matches that of #map enumerable with numeric array' do
      expect(num_array.my_map { num_array_test_block }).to eql(num_array.map { num_array_test_block })
    end

    it 'return matches that of #map enumerable with numeric array' do
      expect(num_array.my_map { multiply_test_block }).to eql(num_array.map { multiply_test_block })
    end
  end

  describe '#my_inject' do
    it 'return matches that of #inject enumerable with numeric array' do
      expect(num_array.my_inject { num_array_test_block }).to eql(num_array.inject { num_array_test_block })
    end

    it 'return matches that of #inject enumerable with numeric array' do
      expect(num_array.my_inject { inject_test_block }).to eql(num_array.inject { inject_test_block })
    end
  end
end
