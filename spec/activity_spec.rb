require_relative '../activity'

describe Activity do
  describe '#activity_name' do
    it 'returns the snake case version of the class name' do
      expect(TestActivity.activity_name).to eql 'test_activity'
    end
  end
end

class TestActivity < Activity; end
