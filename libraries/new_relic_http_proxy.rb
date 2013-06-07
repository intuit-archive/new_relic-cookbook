require 'uri'

module NewRelicHttpProxy

  def proxy_url(args={})
    return '' if args.empty?
    u = URI::HTTP.build :scheme   => args['scheme'],
                        :userinfo => "#{args['user']}:#{args['password']}",
                        :host     => args['host'],
                        :port     => args['port'].to_i
    u.to_s
  end

end

class Chef::Recipe
  include NewRelicHttpProxy
end
