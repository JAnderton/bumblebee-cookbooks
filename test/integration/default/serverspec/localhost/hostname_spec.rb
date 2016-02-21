require 'socket'

describe 'Node' do
  it 'should have hostname set' do
    Socket.gethostname.should eq("Cybershark")
  end
end
