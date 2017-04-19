require 'serverspec'

set :backend, :exec

describe "duo_pam installer" do
  describe package('duo-unix') do
    it { should be_installed }
  end

  describe file('/etc/pam.d/sshd') do
    it { should exist }
    its('content') { should include 'pam_duo.so' }
  end

  describe file('/etc/security/pam_duo.conf') do
    it { should exist }
    its('content') { should include 'BRTYMPKRR8TI06H8Y938' }
  end
  
end
