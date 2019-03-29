# validar si del nombre ingresado existe el .txt
def check_file_data_existence(name)
    name = '../data/' + name.capitalize + '.txt'
    File.exist?(name) || File.symlink?(name) 
end

# validar si existe el archivo dentro de la carpeta public
def check_file_existence(name)
    name = '../public' + name
    File.exist?(name) || File.symlink?(name) 
end

# metodo recibe string
# debe leer los archivos o cargar la pagina de error

def read_string(string_name) 
    string_result = ""

    if string_name.include? ".txt"
        path_string = "../data/#{string_name.capitalize}"
    elsif string_name.include? ".ico"
        path_string = "../styles/#{string_name}"
    elsif string_name == "error.html"
        path_string = "../public/#{string_name}"
    else
        path_string = "../#{string_name}"
    end
    path = Dir.glob(path_string).first
    File.open(path) do |f|
        f.each do |line|
        string_result << line
        end
    end
    string_result
end