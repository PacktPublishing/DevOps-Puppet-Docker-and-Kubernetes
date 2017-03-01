require 'spec_helper'
describe 'profiles' do

  context 'with defaults for all parameters' do
    it { should contain_class('profiles') }
  end
end
