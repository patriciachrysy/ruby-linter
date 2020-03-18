require_relative '../../lib/line'
require_relative '../../lib/modules/preference_helper'
require 'colorize'
require_relative '../../lib/ruby_file'

describe PreferenceHelper do
  let(:line) { Line.new(1, 'for file in files', 'my_class.rb') }
  let(:file) { RubyFile.new('./lib/line.rb') }
  describe '#each_against_for' do
    it 'suggest warning to use each when it meets a for in the code line' do
      expect(PreferenceHelper.each_against_for(line).type).to eql('Warning'.yellow)
    end
  end

  describe '#check_module' do
    it 'Returns false if there is only one class or module defined in the file' do
      expect(PreferenceHelper.check_module(file).class).not_to eql(String)
    end
  end
end
