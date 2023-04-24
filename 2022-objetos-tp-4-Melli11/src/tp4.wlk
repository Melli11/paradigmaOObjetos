
class CarroDeCompras {
	var finalizoCompra = false
	var listaDeProductos = []
	var  nuevaVenta = 0
	
	method listaDeProductos() = listaDeProductos
	
	method agregarProductos(producto) = listaDeProductos.add(producto)

	method cantidadDeProductos() = listaDeProductos.size()
	
	method totalAPagar() = listaDeProductos.sum{unProducto => unProducto.precio()}

//el enunciado no aclara como se eliminan los productos por lo que se eliminará el ultimo que se agregó
	method eliminarProducto() = listaDeProductos.remove(listaDeProductos.last())
	
	method limpiarElCarrito() = listaDeProductos.clear()
	
	method finalizarCompra() {
		nuevaVenta = registroDeVenta.agregarVenta(self.totalAPagar(), self.listaDeProductos())
		self.limpiarElCarrito()
		return !finalizoCompra	
	}

}

class Producto {
	const id 
	const precio
	
	method id() = id
	method precio() = precio
}

object registroDeVenta{
	var registroTotalDeUnaVenta = []
	var registrarTotalDeProductosDeUnaVenta = []
	var finalizoCompra = true
	
	method agregarVenta(totalFacturado,productosVendidos){
		registroTotalDeUnaVenta.add(totalFacturado)
		registrarTotalDeProductosDeUnaVenta.addAll(productosVendidos)
		return finalizoCompra
		}
	
	method registrarTotalDeProductosDeUnaVenta () = registrarTotalDeProductosDeUnaVenta 
	
	method totalFacturado() = registroTotalDeUnaVenta.sum()
	
	method totalDeProductosDeTodasLasVentas() = registrarTotalDeProductosDeUnaVenta
	
	method productoQueMasVecesSeVendio() { 
		var bestSeller 
		var listaIds
		listaIds = self.totalDeProductosDeTodasLasVentas().map{unProducto => unProducto.id()}
		bestSeller = listaIds.max{id => self. cantidadDeVecesQueSeVendio(id) }

		return bestSeller
	}
		
	method cantidadDeVecesQueSeVendio(id) = registrarTotalDeProductosDeUnaVenta.filter{unProducto => unProducto.id() == id}.size() //metodo auxiliar que permite buscar un id (x parametro) en una lista de id 

	}
