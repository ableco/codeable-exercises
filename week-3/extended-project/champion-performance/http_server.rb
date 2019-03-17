require 'socket'
require 'uri'
require './controller/controller'
require './http_handler'

WEB_ROOT = './public'


class HomePage < RequestHandler
  def req
    path = File.join(WEB_ROOT, 'index.html')
    self.send(path)
  end
end

class RequestFile < RequestHandler
  def req
    request_uri = self.request[:uri]
    path = File.join(WEB_ROOT, request_uri)
    self.send(path)
  end
end

class MemberPage < RequestHandler
  def req
    name = self.request[:vars][:name]
    content = controller(name)
    self.write(content)
  end
end

handler = HttpHandler.new('localhost', 2345)

handler.url_router(
  {gate_regex: /^(\/)$/, process:HomePage}, # handles home page
  {gate_regex: /^(\/\w+\.\w+)$/, process:RequestFile}, # handles an specific route
  {gate_regex: /^(\/\?name=\w+)$/, process:MemberPage} # handles the member content
)

loop do
  handler.update_socket
  handler.process_requests
end
