require 'date'

class Portfolio
    attr_accessor :arreglo2018
    
    def initialize
        fecha = Date.parse("2018-01-01")
        dia = 0
        r = Random.new
        fechaPalabra = fecha.to_s
        @arreglo2018 = {fechaPalabra => r.rand(1000...2000)}
        until dia>= 365
            fecha = fecha+1
            fechaPalabra = fecha.to_s
            @arreglo2018.store(fechaPalabra, r.rand(1000...2000))           
            dia +=1           
        end
        
        
    end

    
    def Profit(fechaInicial, fechaFinal)
        fechaInicial = Date.parse(fechaInicial)
        fechaFinal = Date.parse(fechaFinal)

        if fechaInicial<fechaFinal
            diferenciaDias = fechaFinal - fechaInicial
        elsif fechaInicial>fechaFinal
            aux = fechaInicial
            fechaInicial = fechaFinal
            fechaFinal = aux

            diferenciaDias = fechaFinal - fechaInicial
        else
            diferenciaDias = 0            
        end
       
        if(diferenciaDias>360)
            diferenciaDias = 360
        end
        diferenciaDias = diferenciaDias.to_f

        puts "El valor de #{fechaInicial} es #{arreglo2018[fechaInicial.to_s]}"," y el valor de #{fechaFinal} es #{arreglo2018[fechaFinal.to_s]}"
        
        puts "diferencia de dias #{diferenciaDias}",""
        
        
        total = ((arreglo2018[fechaFinal.to_s] - arreglo2018[fechaInicial.to_s])/ diferenciaDias)/360
        total = total*100

        puts "El resultado anualizado es #{total}%"

    end

    def pruebas(fechaPrueba)
        puts arreglo2018["2018-01-01"]
    end
    
    
end


 portfolio = Portfolio.new

respuesta = ""
until respuesta == "n"
    portfolio = Portfolio.new

    puts "Ingresa la fecha inicial con formato YYYY-MM-DD del año 2018"
    fechaInicial = gets.chomp
    puts ""
    puts "Ingresa la fecha final con formato YYYY-MM-DD del año 2018"
    fechaFinal = gets.chomp
    
    puts "",""
    portfolio.Profit(fechaInicial, fechaFinal)

    puts ""
    puts "Presiona 'n' si quierse salir, de lo contrario cualquier letra para calcular denuevo",""
    
    respuesta = gets.chomp
end