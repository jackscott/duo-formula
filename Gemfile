source "https://rubygems.org"

gem "kitchen-vagrant"
gem "unf"
gem "kitchen-salt", ">= 0.0.18"

group :workaround do
    gem 'rainbow', '~>2.0', '!=2.2.1'
end

group :test, :development do
  gem "inspec"
  gem 'net-ssh' #, '~> 2.0'
  gem 'serverspec'
end
