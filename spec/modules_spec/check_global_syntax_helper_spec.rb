require_relative '../../lib/line'
require_relative '../../lib/modules/check_global_syntax_helper'
require_relative '../../lib/ruby_file'

describe CheckGlobalSyntaxHelper do
  let(:line_class) { Line.new(1, ' class MyClass', 'class.rb') }
  let(:file) { RubyFile.new('./lib/line.rb') }
  describe '#check_open_end' do
    it 'returns false if the blocks are well closed in the file' do
      expect(CheckGlobalSyntaxHelper.check_open_end(file)).to eql(false)
    end
  end

  describe '#check_spaces' do
    it 'Returns a string if the class is preceeded by a space character' do
      expect(CheckGlobalSyntaxHelper.check_spaces(line_class)).not_to eql(false)
    end
  end
end
