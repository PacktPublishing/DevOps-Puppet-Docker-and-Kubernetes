require 'spec_helper'

describe 'heartbeat' do
  it { should contain_package('heartbeat') }
  it { should contain_service('heartbeat').with('ensure' => 'running') }
  it { should contain_file('/etc/ha.d/ha.cf') }
end
