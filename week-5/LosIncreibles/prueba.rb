require 'faker'

Faker::Config.locale = 'es'

file_cursos = File.open("cursos.sql","w")

file_docentes = File.open("docentes.sql","w")

file_alumno = File.open("alumnos.sql","w")

file_asignatura = File.open("asignaturas.sql","w")

1000.times do

    # Curso

    cursos = Faker::Educator.subject

    # Docente

    doc_nombre = Faker::Name.name

    oficina = Faker::Address.state_abbr

    # Alumno

    especialidad = Faker::Educator.subject

    alu_nombre = Faker::Name.name

    #Asignatura

    seccion = Faker::Alphanumeric.alpha

    file_cursos.puts "insert into cursos values(default,'#{cursos}');"

    file_docentes.puts "insert into docentes values(default,'#{doc_nombre}','#{oficina}');"

    file_alumno.puts "insert into alumnos values(default,'#{alu_nombre}','#{especialidad}');"

    file_asignatura.puts "insert into asignatura_dictada values(default,#{rand(1...1000)},#{rand(1...1000)},#{rand(1...1000)},'#{seccion.upcase}');"

end