require 'spec_helper'
describe 'azure_agent' do

  context 'with defaults for all parameters' do
    it { should contain_class('azure_agent') }
  end
end
