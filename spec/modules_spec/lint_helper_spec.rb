require_relative '../../lib/line'
require_relative '../../lib/modules/lint_helper'
require 'colorize'
require_relative '../../lib/ruby_file'

describe LintHelper do
  let(:errors) { [] }
  let(:file) { './lib/line.rb' }
  let(:dir) { './libs' }
  describe '#start_linting_file' do
    it 'returns an empty errors array when the file is clean' do
      LintHelper.start_linting_file(file, errors)
      expect(errors.empty?).to eql(true)
    end
  end

  describe '#start_linting_dir' do
    it 'Returns nothing when the folder is empty' do
      expect(LintHelper.start_linting_file(dir, errors).class).not_to eql(String)
    end
  end
end
