require_relative '../lib/ruby_file'

describe RubyFile do
  describe '#set_lines' do
    it 'It turn the file content into an array of lines' do
      file = RubyFile.new('./bin/main.rb')
      expect(file.lines[0].content).to eql('#!/usr/bin/env ruby')
    end
  end
end
