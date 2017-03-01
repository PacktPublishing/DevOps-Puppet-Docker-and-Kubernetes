require 'spec_helper'
describe 'roles' do

  context 'with defaults for all parameters' do
    it { should contain_class('roles') }
  end
end
