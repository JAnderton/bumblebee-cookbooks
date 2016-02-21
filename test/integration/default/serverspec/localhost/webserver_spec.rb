require 'spec_helper'

describe 'Webserver' do
  it 'should have Apache httpd installed and running as service' do
    expect(service 'apache2').to be_running be_enabled
  end

  it 'should be listening to port 80' do
    expect(port 80).to be_listening
  end
end
