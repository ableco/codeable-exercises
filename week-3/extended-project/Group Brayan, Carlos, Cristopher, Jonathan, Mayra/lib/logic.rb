# Esta linea está llamando a la clase Socket que tiene Ruby
require 'socket'
require_relative 'logic_methods'

# Aquí está iniciando una conexión en el puerto 8000
server = TCPServer.new 8000

loop do
  # Espera a que un cliente se conecte
  client = server.accept
  result = ""
  code_http = "200"
  content_type = "text/html"

  # Recuperando toda la información enviada en la petición (request)
  req = client.gets
  # Cuando en algún momento la llamada sea por el cache del browser
  # el valor de la solicitud (request) será nil
  unless req == nil
    # El formato del valor devuelto de req es
    # GET data HTTP/1.1\r\n
    # Usamos el split para obtener solo la parte de data
    request = req.split(" ")[1]
    if request.include?("/?member=")
      request["/?member="] = ""
      if check_file_data_existence(request)
        data = read_string(request + ".txt").split("---------")
        result = read_string("about.html")
        8.times { |val| result["YYYYYYYY#{val + 1}"] = data[val]; }
      else
        code_http = "404"
        result = read_string("error.html")
      end
    elsif /^\/$|.css|.ico/ === request
      if request.include?(".css")
        content_type = "text/css"
      elsif request.include?(".ico")
        content_type = "image/x-icon"
      elsif request == "/"
        request = "index.html"
      end
      result = read_string(request)
    else
      if check_file_existence(request)
        request = "public" + request
      else
        code_http = "400"
        request = "error.html" unless request == "error.html"
      end
      result = read_string(request)
    end
  end
  client.print "HTTP/1.1 #{code_http}\n"
  client.print "Content-Type: #{content_type}\n"
  client.print "\n"
  client.print result
  client.close
end
