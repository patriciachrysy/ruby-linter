require_relative '../lib/line'
require_relative '../lib/ruby_file'

describe Line do
  let(:file) { RubyFile.new('./bin/main.rb') }
  describe '#words' do
    it 'Split the line into an array to strings' do
      expect(file.lines[0].words).to eql(%w[#!/usr/bin/env ruby])
    end
  end

  describe '#check_syntax' do
    it 'Check if the line does not match a regex' do
      expect(file.lines[0].check_syntax(/^[a-z]/)).not_to eql(true)
    end
  end

  describe '#check_include' do
    it 'Check if a word does not appear on a line' do
      expect(file.lines[0].check_include('class')).not_to eql(true)
    end
  end

  describe '#check_length' do
    it 'checks if a line is not longer than require' do
      expect(file.lines[0].check_length).to eql(true)
    end
  end

  describe '#opening_line?' do
    it 'Checks if the line is an oppening line' do
      expect(file.lines[0].opening_line?).not_to eql(true)
    end
  end

  describe '#closing_line?' do
    it 'Checks if the line is a closing line' do
      expect(file.lines[13].closing_line?).to eql(true)
    end
  end
end
