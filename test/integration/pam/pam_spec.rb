describe package('duo_unix') do
  it { should be_installed }
end

describe file('/etc/pam.d/sshd') do
  it { should exist }
  its('content') { should include 'auth  sufficient pam_duo.so' }
end

describe file('/etc/duo/pam_duo.conf') do
  it { should exist }
  its('content') { should include 'BRTYMPKRR8TI06H8Y938' }
end
