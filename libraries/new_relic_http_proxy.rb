require 'uri'

module NewRelicHttpProxy

  def proxy_url(args={})
    p args
    return '' if args.empty?
    userinfo = nil 
    if args['user'] && args['password']
      puts '123 test'
      userinfo = "#{args['user']}:#{args['password']}"
    end
    u = URI::HTTP.build :scheme   => args['scheme'],
                        :host     => args['host'],
                        :port     => args['port'].to_i,
                        :userinfo => userinfo
    u.to_s
  end

end

class Chef::Recipe
  include NewRelicHttpProxy
end
