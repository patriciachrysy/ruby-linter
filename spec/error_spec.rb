require_relative '../lib/line'
require_relative '../lib/error'

describe Line do
  let(:line) { Line.new(1, 'class my_class', 'my_class.rb') }
  let(:error) { Error.new(line) }
  describe '#raise_naming_error' do
    it 'returns an error object with warning type' do
      expect(error.raise_naming_error('respect camel case').class).to eql(Error)
    end
  end
end
