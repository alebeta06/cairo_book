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

