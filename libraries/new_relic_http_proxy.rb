require 'uri'

class NewRelicHttpProxy

  def initialize(args={})
    @args = args
  end

  def to_url
    u = URI::HTTP.build :scheme   => args['scheme'],
                        :userinfo => "#{args['user']}:#{args['password']}",
                        :host     => args['host'],
                        :port     => args['port'].to_i
    u.to_s
  end

  private
  attr_accessor :args

end
