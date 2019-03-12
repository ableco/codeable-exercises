$global="Mundo"

class Test

    @@tipo_trabajador="Administrativos"

    def initialize(name)
        @name=name
        
    end

    def mostrar
        var_local="Operaciones"
        variables
        $global="Nuevo Mundo "
        @@tipo_trabajador="Nuevos Administrativos"
        @name="Nuevo nombre"
        variables

    end

    def variables
        puts $global
        puts @@tipo_trabajador
        puts @name
    
    end

end


test_a= Test.new("MARIA")
test_a.mostrar

test_b= Test.new("JUAN")
test_b.mostrar
