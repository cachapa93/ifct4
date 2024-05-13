select concat('sara ','os da los ', 'buenos dias ')



use TODO_SUBCADENAS



select * from productos;

declare @nombre varchar(10), @edad int
set @nombre = 'Dairy';
set @edad=30;
print 'hola, me llamo  ' + @nombre +' y tengo '+cast (@edad as varchar(3)) + 'años'
print 'hola, me llamo ' + @nombre +' y tengo '+convert(varchar(3),@edad)+' año'



declare @nombre1 varchar(10)='Dairy' ,@edad1 int=30
print 'hola, me llamo  ' + @nombre1 +' y tengo '+cast (@edad1 as varchar(3)) + ' años'
print 'hola, me llamo ' + @nombre1 +' y tengo '+convert(varchar(3),@edad1)+' años'




--declaracion de variables 
declare @nombre3 varchar(30)
declare @N1 int , @N2 int, @N3 int, @N4 int ,@promedio decimal(5,2)
--asignamos valores
set @nombre3 = 'fernanda torres lazaro'
set @N1=12
set @N2=20
set @N3=15
set @N4=18
--calculamos el promedio de cuatro notas inicializadas en unos valores predeterminados ---pagina 195
set @promedio=(@N1+@N2+@N3+@N4)/4.0
--mostramos el resultado
print '+++ resumen de notas +++'
print'---------------------------'
print 'estudiante: '+@nombre3
print' la nota 1: '+cast(@N1 as char(2))
print' la nota 2: '+cast(@N2 as char(2))
print' la nota 3: '+cast(@N3 as char(2))
print' la nota 4: '+cast(@N4 as char(2))
print'----------------------------'
print' el promedio es: '+cast(@promedio as char(5))
go


-- usando declare

--declaracion de variables
 
 declare @nombre4 varchar(50) ='fernanda torres lazaro'
 declare @N1 int=12,@N2 int=20,@N3 int=15, @N4 int=18,@promedio decimal(5,2)
 --calculamos el promedio
 set @promedio=(@N1+@N2+@N3+@N4)/4.0

--mostrando el resultado
print '+++resumen de las notas+++'
print'-------------------------------'
print 'estudiante ' + @nombre4
print 'la nota 1: '+cast(@N1 as char(2))
print' la nota 2: '+cast(@N2 as char(2))
print 'la nota 3: '+cast(@N3 as char(2))
print 'la nota 4: '+cast(@N4 as char(2))
print'----------------------------------'
print ' el promedio es: '+cast(@promedio as char(10))
go



--se hara una consulta que permita mostrar la informacion de los productos con tipo de unidad MLL
--haciendo uso de variables locales

use  BDVENTAS

select * from PRODUCTO;


declare  @uni char(3)='MLL'
select p.cod_pro, p.des_pro, p.pre_pro, p.uni_pro
from PRODUCTO p
where UNI_PRO =@uni
go


--se hare una consulta que permita mostrar la razon social del cliente asociado
-- a una determinada factura, haciendo uso de variables locales;el resultado se debe mostrar
--de la siguiente manera-->'la factura con F005 tiene como cliente a hayashi'

select * from factura inner join cliente on cliente.COD_CLI=FACTURA.COD_CLI;

select * from CLIENTE;



declare @fact char(5)='FA005'
declare @cliente varchar(30)
select @cliente = c.RSO_CLI
		from FACTURA f
		join cliente c on f.COD_CLI=c.COD_CLI
		where NUM_FAC=@fact
print ' la factura con '+@fact + ' tiene como cliente a '+@cliente
go



--primera version:

declare @monto money
set @monto= 1250.75
print ' el monto ingresado es: '+ @monto
go        --da error pues el tipo de dato de money no coincide con el tipo de dato de monto.


--segunda version 

declare @monto money
set @monto = 1250.75
select @monto as [valor de monto]
go

--tercera version

declare @monto money
set @monto= 1250.75

print ' el monto ingresado es: '+cast(@monto as varchar(50))


--cuarta version

DECLARE @MONTO MONEY
SET @monto = 1250.75
PRINT ' EL MONTO INGRESADO ES: '+convert(varchar(10),@monto)
go

--quinta version
declare @monto money 
set @monto = 1250.75
print ' el monto inrgresado es: '+str(@monto)
go


--ejercicio de suma y resta y una multiplicacion
 declare @valor1 money
 declare @valor2 money
 declare @valor3 money
 declare @sumatotal money

 set @valor1=100                 --suma de los valores 1 y dos 
 set @valor2=80
 set @valor3=20
  
 set @sumatotal= @valor1 + @valor2

 PRINT 'La suma total es: ' + CAST(@sumaTotal AS VARCHAR(50));
go

 declare @valor1 money
 declare @valor2 money
 declare @valor3 money
 declare @sumatotal money
 declare @restatotal money


 set @valor1=100                 --resta de los valores 2 y 1
 set @valor2=80
 set @valor3=20
  
 set @restatotal = @valor1 - @valor2 

 print 'la resta del valor 2 al valor 1 es: ' + cast(@restatotal as varchar (50));
 go



  declare @valor1 money
 declare @valor2 money
 declare @valor3 money
 declare @sumatotal money
 declare @restatotal money
 declare @multiplicacion money 



 set @valor1=100                
 set @valor2=80
 set @valor3=20
  


  set @multiplicacion = @valor1 * @valor2
 print '--------------------------------'
 print '-------multiplicacion-----------'
 
 
 print ' la multiplicacion del valor 1 por el valor 2 es: ' + cast(@multiplicacion as varchar(50))
  go
  print '---------------------------------------'


print ' la suma total es: '+cast (sum(@valor1,@valor2,@valor3))
go



--poner las tres operaciones juntas en un solo recuadro
--una suma, una resta y una multiplicacion 

declare @valor1 money
declare @valor2 money
declare @sumatotal money
declare @resta money	
declare @multiplicacion money 

set @valor1=100
set @valor2=80

set @multiplicacion= @valor1 * @valor2
set @resta= @valor1 - @valor2	
set @sumatotal= @valor1 + @valor2

print '-------------------------------------------'
print '----------operaciones totales---------'
print '------ la multiplicacion de los dos valores es: '+ cast(@multiplicacion as varchar(50))
print '--------la suma total de los valores es : '+ cast (@sumatotal as varchar(50))
print '-----------la resta de los valores es : ' + cast(@resta as varchar(50))
print'------------------------------------------'
go 

hola
