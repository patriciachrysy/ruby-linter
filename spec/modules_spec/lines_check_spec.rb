require_relative '../../lib/line'
require_relative '../../lib/modules/lines_check'
require_relative '../../lib/ruby_file'

describe PreferenceHelper do
  let(:errors) { [] }
  let(:line) { Line.new(1, ' class myclass', 'my_class.rb') }
  let(:file) { RubyFile.new('./lib/line.rb') }
  describe '#LinesCheck' do
    it 'returns the same error array passed if the line lenght is ok' do
      expect(LinesCheck.check_length(errors, line)).to eql(errors)
    end
  end

  describe '#check_spacing' do
    it 'Returns an error in the array if there is a space before class declaration' do
      expect(LinesCheck.check_spacing(errors, line)).not_to eql(true)
    end
  end

  describe '#check_syntax' do
    it 'Returns the same error array if the syntax is ok' do
      expect(LinesCheck.check_syntax(errors, line)).to eql(errors)
    end
  end

  describe '#check_syntax' do
    it 'Returns the same error array if the syntax is ok' do
      expect(LinesCheck.check_syntax(errors, line)).to eql(errors)
    end
  end
end
