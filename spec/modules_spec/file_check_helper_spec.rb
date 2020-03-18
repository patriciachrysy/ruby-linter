require_relative '../../lib/line'
require_relative '../../lib/modules/file_check'
require_relative '../../lib/ruby_file'

describe FileCheck do
  let(:errors) { [] }
  let(:line) { Line.new(1, ' class myclass', 'my_class.rb') }
  let(:file) { RubyFile.new('./lib/line.rb') }
  let(:dir) { './libs' }
  describe '#check_file' do
    it 'returns the same error array passed if the file syntax is ok' do
      expect(FileCheck.check_file(errors, file)).to eql(errors)
    end
  end

  describe '#file_exist' do
    it 'Returns true if the file do exist' do
      expect(FileCheck.file_exist('./lib/line.rb')).not_to eql(false)
    end
  end

  describe '#dir_exist' do
    it 'Returns a string if the folder does not exist' do
      expect(FileCheck.dir_exist(dir).class).to eql(String)
    end
  end

  describe '#content_ruby_files' do
    it 'Returns an array of filenames when the the folder contains ruby files' do
      expect(FileCheck.content_ruby_files('./lib').class).to eql(Array)
    end
  end
end
