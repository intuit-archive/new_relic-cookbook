require 'spec_helper'

describe NewRelicHttpProxy do

  describe 'proxy_url' do
    let(:object) do
      Object.new.extend(NewRelicHttpProxy)
    end

    let(:args) do
      {
        'host'     => 'foo.example.com',
        'port'     => '8080',
        'scheme'   => 'http',
        'user'     => 'bob',
        'password' => 'rock'
      }
    end
    subject { :object }

    it 'returns the proxy url' do
      object.proxy_url(args).should eq 'http://bob:rock@foo.example.com:8080'
    end
    it 'returns the proxy url without a proxy user and password' do
      args.delete 'user'
      args.delete 'password'
      object.proxy_url(args).should eq 'http://bob:rock@foo.example.com:8080'
    end

    context 'when passing in empty args' do
      it 'should return an empty string' do
        object.proxy_url({}).should eq ''
      end
    end

  end

end
