#[executable]
fn main() {
    // Crear una matriz de enteros
    let mut arr = ArrayTrait::<u128>::new();
    arr.append(10);
    arr.append(20);
    arr.append(30);

    // Leer el primer elemento con at()
    let first = *arr.at(0);
    println!("El primer elemento es: {}", first);

    // Eliminar el primer elemento
    let removed = arr.pop_front().unwrap();
    println!("Elemento removido: {}", removed);

    // Usar la macro array! para crear otra matriz
    let arr2 = array![100, 200, 300];
    println!("El segundo elemento de arr2 es: {}", *arr2.at(1));
}
//Este ejemplo muestra la creación, lectura, eliminación y uso de la macro para crear matrices

//Sin array!:

//let mut arr = ArrayTrait::new();
//arr.append(1);
//arr.append(2);
//arr.append(3);
//arr.append(4);
//arr.append(5);

//El uso de la macro array! es más conciso y fácil de leer que la creación manual de una matriz.

//let arr = array![1, 2, 3, 4, 5];

//el operador * se utiliza para desreferenciar el puntero devuelto por at() para obtener el valor
//u128 directamente almacenado en la matriz.
//En Cairo, los métodos como .at(index) devuelven referencias en lugar de valores directos para
//optimizar el uso de memoria y evitar copias innecesarias.
//Si queremos trabajar con el valor real, usamos * para obtenerlo.

