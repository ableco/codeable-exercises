require 'socket'
require './controller/controller'

DEFAULT_CONTENT_TYPE = 'application/octet-stream'

CONTENT_TYPE_MAPPING = {
  'html' => 'text/html',
  'txt' => 'text/plain',
  'png' => 'image/png',
  'jpg' => 'image/jpeg'
}

def content_type(path)
  ext = File.extname(path).split(".").last
  CONTENT_TYPE_MAPPING.fetch(ext, DEFAULT_CONTENT_TYPE)
end


class TCPSocket
  #TODO: add content type
  def write_response(content)
    self.print "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/html\r\n" +
    "Content-Length: #{content.size}\r\n" +
    "Connection: close\r\n"

    self.print "\r\n"
    self.print content
  end
 #TODO : add directory check
  def send_response(path)
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




class RequestHandler
  attr_reader :request

  def initialize(socket)
    @socket = socket
  end

  def write(content)
    @socket.write_response(content)
  end

  def send(path)
    @socket.send_response(path)
  end

  def dispatch(request)
    @request = request
    #parse request and extract data
  end

  def update(socket)
    @socket = socket
  end

end


class HttpHandler

  def initialize(host, port)
    @server = TCPServer.new('localhost', 2345)
  end

  def update_socket()
    @socket = @server.accept
    request_line = @socket.gets
    @uri_values = request_line.split(" ")[1]
    STDERR.puts  "updated"
  end

  def process_requests()
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

    request_uri = '/'
    request_vars_arr = []
    vars_hash = []
    if uri_values.include?('?')
      request_uri, request_vars = uri_values.split('?')
      if request_vars.include?('&')
        request_vars_arr = request_vars.split('&')[1]
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

#
# class HttpHandler
#   attr_reader :request
#
#   def initialize(host, port)
#     @server = TCPServer.new('localhost', 2345)
#   end
#
#   def update_socket()
#     @socket = @server.accept
#     self.parse_request(@socket.gets)
#   end
#
#   def parse_request(request_line)
#     http_request = request_line.split(" ")[1]
#     request_uri, request_vars = http_request.split('?')
#
#     request_vars_arr = request_vars.split('&')[1]
#     request_vars_arr.map! {|str| str.split('=')}
#
#     @request = {
#       uri: request_uri,
#       vars: request_vars_arr.to_h
#     }
#   end
#
#   def url_router(*args)
#
#     request_uri  = @request_line.split(" ")[1]
#
#     args.each do |gate|
#       if gate[:regex_gate] === request_uri
#         gate_handler = gate[:process]
#         if gate_handler.format == "file"
#
#           path   = URI.unescape(URI(request_uri).path)
#
#           clean = []
#           parts = path.split("/")
#
#           parts.each do |part|
#             next if part.empty? || part == '.'
#             part == '..' ? clean.pop : clean << part
#           end
#
#           path = File.join(WEB_ROOT, *clean)
#
#           response_from_path(path)
#         end
#
#         if gate[:process].format == "string"
#
#           paramstring = request_uri.split('?')[1]
#           name = paramstring.split('=')[1]
#
#           response_from_string(controller(name))
#
#         end
#
#       end
#     end
#
#     @socket.close
#   end
#
#
#   def response_from_path(path) #sends html file from path
#     path = File.join(path, 'index.html') if File.directory?(path) #adds index.html if path is a directory
#
#     if File.exist?(path) && !File.directory?(path) # check if it is a directory or a file
#       File.open(path, "rb") do |file|
#         @socket.print "HTTP/1.1 200 OK\r\n" +
#                     "Content-Type: text/html\r\n" +
#                     "Content-Length: #{file.size}\r\n" +
#                     "Connection: close\r\n"
#
#         @socket.print "\r\n"
#
#         IO.copy_stream(file, @socket)
#       end
#     else
#       message = "File not found\n"  # shows the error message
#
#       @socket.print "HTTP/1.1 404 Not Found\r\n" +
#                   "Content-Type: text/plain\r\n" +
#                   "Content-Length: #{message.size}\r\n" +
#                   "Connection: close\r\n"
#
#       @socket.print "\r\n"
#
#       @socket.print message
#     end
#
#   end
#
#   def response_from_string(file)
#
#     @socket.print "HTTP/1.1 200 OK\r\n" +
#     "Content-Type: text/html\r\n" +
#     "Content-Length: #{file.size}\r\n" +
#     "Connection: close\r\n"
#
#     @socket.print "\r\n"
#     @socket.print file
#
#   end
#
# end
