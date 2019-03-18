require 'socket'
require './controller/controller'

#default content type 
DEFAULT_CONTENT_TYPE = 'application/octet-stream'

# content types constants
CONTENT_TYPE_MAPPING = {
  'html' => 'text/html',
  'txt' => 'text/plain',
  'css' => 'text/css',
  'png' => 'image/png',
  'jpg' => 'image/jpeg'
}

#extract extension from file
def content_type(path)
  ext = File.extname(path).split(".").last
  CONTENT_TYPE_MAPPING.fetch(ext, DEFAULT_CONTENT_TYPE)
end

#extend class tcpsocket from socket
#tcpsocket class extend capabilities
class TCPSocket
  #TODO: add content type
  #TODO: add header object
  def write_response(content) # send a response from a string
    self.print "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/html\r\n" +
    "Content-Length: #{content.size}\r\n" +
    "Connection: close\r\n"

    self.print "\r\n"
    self.print content
  end
 #TODO : add directory check
 #TODO : add 404 response
  def send_response(path) # send a response from a file
    File.open(path, "rb") do |file|
      self.print "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: #{content_type(file)}\r\n" +
                  "Content-Length: #{file.size}\r\n" +
                  "Connection: close\r\n"

      self.print "\r\n"
      IO.copy_stream(file, self)
    end
  end

end




class RequestHandler # class to delegate a page actions to http_handler
  attr_reader :request

  def initialize(socket)
    @socket = socket
  end

  # send response from a string
  def write(content)
    @socket.write_response(content)
  end

  # send response from a file
  def send(path)
    @socket.send_response(path)
  end

  #update the request hash
  def dispatch(request)
    @request = request
  end

  #update socket before sending a response
  def update(socket)
    @socket = socket
  end

end

#handles all application 
class HttpHandler

  def initialize(host, port) #initialize server
    @server = TCPServer.new('localhost', 2345)
  end

  def update_socket()
    @socket = @server.accept # waits for socket
    request_line = @socket.gets # gets 
    @uri_values = request_line.split(" ")[1]
    STDERR.puts  "updated"
  end

  def process_requests() # 
    STDERR.puts  "processing request"
    STDERR.puts  @uri_values
    self.clear_request()
    c = 0
    @gate_arr.each do |gate|
      if gate[:gate_regex] === @uri_values
        STDERR.puts "match #{c}"
        @request = self.parse_request(@uri_values)
        gate[:process].update(@socket)
        gate[:process].dispatch(@request)
        gate[:process].req
      end
      c += 1
    end
    @socket.close
    STDERR.puts "ended processing "
  end

  def parse_request(uri_values)
  #TODO: validate weird uri's
    request_uri = '/'
    request_vars_arr = []
    vars_hash = []
    if uri_values.include?('?')
      request_uri, request_vars = uri_values.split('?')
      if request_vars.include?('&')
        request_vars_arr = request_vars.split('&')
        request_vars_arr.map! {|str| str.split('=')}
      else
        request_vars_arr << request_vars.split('=')
      end
      request_vars_arr.map! {|v| [v[0].to_sym, v[1]]}
      vars_hash = request_vars_arr.to_h

    else
      #TODO: add secure uri
      request_uri = uri_values
    end

    {
      uri: request_uri,
      t_uri: uri_values,
      vars: vars_hash
    }
  end

  def clear_request()
    @request ={
      uri: '/',
      t_uri: '/',
      vars: {}
    }
  end

  def url_router(*args)
    @gate_arr = args.map do |gate|
      gate_regex = gate[:gate_regex]
      gate_handler = gate[:process].new(@socket)

      {gate_regex: gate_regex, process:gate_handler}
    end
  end


end
