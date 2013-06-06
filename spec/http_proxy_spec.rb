require 'spec_helper'

describe NewRelicHttpProxy do

  describe 'to_url' do
    let(:args) do
      {
        'host'     => 'foo.example.com',
        'port'     => '8080',
        'scheme'   => 'http',
        'user'     => 'bob',
        'password' => 'rock'
      }
    end
    subject { NewRelicHttpProxy.new(args) }

    its(:to_url) { should eq 'http://bob:rock@foo.example.com:8080' }

  end

end
