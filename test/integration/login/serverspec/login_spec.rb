require "serverspec"

set :backend, :exec

describe "duo_unix installer " do
  describe package('duo_unix') do
    it { should be_installed }
  end

  describe file('/etc/duo/login_duo.conf') do
    it { should exist }
    its('content') { should include 'BRTYMPKRR8TI06H8Y938' }
  end

end
