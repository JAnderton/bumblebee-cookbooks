require 'spec_helper'

describe 'Webserver' do
  it 'should have nginx installed and running as service' do
    expect(service 'nginx').to be_running
    expect(service 'nginx').to be_enabled
  end

  it 'should be listening to port 80' do
    expect(port 80).to be_listening
  end
end
