require 'spec_helper'
describe 'idm' do

  context 'with defaults for all parameters' do
    it { should contain_class('idm') }
  end
end
