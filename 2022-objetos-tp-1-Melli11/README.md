# Consigna TP-1

## Sueldos

Implementar en Wollok los objetos necesarios para calcular el sueldo de pepe.

    El sueldo se pepe se calcula así: 

**sueldo = neto + bono x resultados + bono x presentismo**.

### Neto

El _neto_ depende de la categoría, hay varias categorías: 
Contemplar al menos estas dos: 

* _gerentes_: que ganan 15000 de neto
* _cadetes_: cuyo neto es 20000.
  Tener en cuenta que puede haber más categorías.

### Bono por resultados

Pepe tiene un bono por resultados que va cambiando a lo largo del tiempo. Sabemos que hay tres posibilidades para el **bono por resultados**:  

* _Porcentaje_: 10% sobre el neto.  
* _Monto fijo_: $800 fijos.
* _Nulo_: nada.

### Bono por presentismo

Al igual que el Bono por resultados, Pepe posee un bono por presentismo que puede variar mes a mes. Existen varios **bonos por presentismo**:

* _Normal_: 2000 pesos si la persona a quien se aplica no faltó nunca, 1000 si faltó sólo un día, 0 en cualquier otro caso. 
* _Ajuste_: 100 pesos si el empleado no faltón nunca, 0 en cualquier otro caso. 
* _Demagógico_: 500 pesos si el neto es menor a 18000, 300 en caso contrario. Para este bono no importa cuántas veces faltó el emplado.
* _Nulo_: nada. 


## Más variantes

1. Definir a **Sofía**, otra persona de la que hay que calcular el sueldo. Sofía solamente tiene bono por resultados, o sea que su sueldo se calcula como ```neto + bono x resultados```.
   A su vez, su neto es un 30% superior a lo que indica su categoría. P.ej. si Sofía es cadete, su neto es 26000. Recordar que para aumentar un número un 30%, se lo multiplica por 1.3.

**Atención**: 
	Si Pepe, o cualquier otra persona que se agregue, es cadete, su neto es 20000. El incremento del 30% se aplica _solamente_ a Sofía. 

1. Agregar la siguiente categoría
   
   - **vendedor**: 
   su neto es de 16000 pesos. Si hay muchas ventas, hay un aumento de 25% para todos los vendedores, o sea pasa a 20000. 
   Pista: hagan que el objeto que representa a esta categoría entienda los mensajes `activarAumentoPorMuchasVentas()` y `desactivarAumentoPorMuchasVentas()`.

2. Agregar dos personas más, según lo que se detalla a continuación.
   
   - **Carla**, que en lugar de asignársele una categoría, se establece un neto de 28000 pesos. 
     El sueldo se calcula como ```neto + bono por resultados + 9000 pesos```. 
     Para el bono por resultados, se usan las mismas opciones que para Pepe.
   
   - **Oliver**, que trabaja junto con un compañero, que puede cambiar. El neto de Oliver es igual al de su compañero. 
     Su sueldo se calcula como ```neto + bono por presentismo```. 
     Para el bono por presentismo, usar las mismas opciones que para Pepe. Se sabe que Oliver no falta nunca.
