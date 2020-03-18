require_relative '../../lib/line'
require_relative '../../lib/modules/check_naming_helper'
require_relative '../../lib/ruby_file'

describe CheckNamingHelper do
  let(:line_class) { Line.new(1, ' class MyClass', 'class.rb') }
  let(:line_meth) { Line.new(1, ' def MyMethod', 'class.rb') }
  describe '#check_class_module' do
    it 'returns false if the class name repects the camel case' do
      expect(CheckNamingHelper.check_class_module(line_class)).to eql(false)
    end
  end

  describe '#check_method_naming' do
    it 'Returns a string if the method name does not respect the namespacing rule' do
      expect(CheckNamingHelper.check_method_naming(line_meth)).not_to eql(false)
    end
  end
end
