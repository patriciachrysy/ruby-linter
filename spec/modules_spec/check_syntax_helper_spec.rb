require_relative '../../lib/line'
require_relative '../../lib/modules/check_syntax_helper'
require_relative '../../lib/ruby_file'

describe CheckSyntaxHelper do
  let(:line_cond) { Line.new(1, ' if age==32', 'my_class.rb') }
  let(:line_loop) { Line.new(1, 'loop {}', 'my_class.rb') }
  let(:line_while) { Line.new(1, 'while age==32', 'my_class.rb') }
  let(:line_for) { Line.new(1, ' for age in ages', 'my_class.rb') }
  let(:line_time) { Line.new(1, '3.times do {}', 'my_class.rb') }
  describe '#check_cond_syntax' do
    it 'returns false if the syntax of the if correct' do
      expect(CheckSyntaxHelper.check_cond_syntax(line_cond)).to eql(false)
    end
  end

  describe '#check_loop_syntax' do
    it 'returns a string if the syntax of the loop is not correct' do
      expect(CheckSyntaxHelper.check_loop_syntax(line_loop)).not_to eql(false)
    end
  end

  describe '#check_while_until_syntax' do
    it 'returns false if the syntax of the while correct' do
      expect(CheckSyntaxHelper.check_while_until_syntax(line_while)).to eql(false)
    end
  end

  describe '#check_for_syntax' do
    it 'returns a string if the syntax of the for is not correct' do
      expect(CheckSyntaxHelper.check_for_syntax(line_for)).to eql(false)
    end
  end

  describe '#check_times_syntax' do
    it 'returns a string if the syntax of the times is not correct' do
      expect(CheckSyntaxHelper.check_times_syntax(line_time)).not_to eql(false)
    end
  end
end
