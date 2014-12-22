require 'spec_helper'

describe 'freebsd_poudriere' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "freebsd_poudriere class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('freebsd_poudriere::params') }
        it { should contain_class('freebsd_poudriere::install').that_comes_before('freebsd_poudriere::config') }
        it { should contain_class('freebsd_poudriere::config') }
        it { should contain_class('freebsd_poudriere::service').that_subscribes_to('freebsd_poudriere::config') }

        it { should contain_service('freebsd_poudriere') }
        it { should contain_package('freebsd_poudriere').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'freebsd_poudriere class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('freebsd_poudriere') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
