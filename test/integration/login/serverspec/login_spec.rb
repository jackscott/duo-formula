require "serverspec"

set :backend, :exec

describe "duo_unix installer " do
  describe package('duo-unix') do
    it { should be_installed }
  end

  describe file('/etc/security/login_duo.conf') do
    it { should exist }
    its('content') { should include 'BRTYMPKRR8TI06H8Y938' }
  end

end
