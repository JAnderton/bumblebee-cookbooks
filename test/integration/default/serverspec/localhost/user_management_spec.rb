require 'spec_helper'

describe 'User Management' do
  it 'should create a group called www' do
    expect(group 'www').to exist
  end

  it 'should create a user called www-nginx' do
    expect(user 'www-nginx').to exist
  end

  it 'should assign group www to user www-nginx' do
    expect(user 'www-nginx').to belong_to_group 'www'
  end
end
