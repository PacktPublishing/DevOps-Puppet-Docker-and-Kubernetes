require 'spec_helper'

describe 'thing' do
  it { should create_class('thing') }
  it { should contain_package('thing') }
  it { should contain_service('thing').with(
    'ensure' => 'running'
  ) }
  #it { should contain_file('/etc/things.conf') }
  it { should contain_file('/etc/thing.conf') }
end
