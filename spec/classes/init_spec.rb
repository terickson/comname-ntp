require 'spec_helper'

describe 'ntpx' do
  context 'when being applied on CentOS' do
    let(:facts) {{ :osfamily => 'RedHat' }}
    let(:params) {{
      :drift_file_path => '/test/path',
      :ntp_servers => [
        'server1',
        'server2',
        'server3'
      ]
    }}

    it { should contain_package('ntp').with({
      'ensure' => 'latest',
    })}

    it { should contain_file('/etc/ntp.conf').with({
      'ensure' => 'file',
      'mode'   => '0644',
    })}

    it { should contain_file('/test/path').with({
      'ensure' => 'file',
      'mode'   => '0755',
    })}

    it { should contain_service('ntpd').with({
      'ensure' => 'running',
    })}
  end
end
