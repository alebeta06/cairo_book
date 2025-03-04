#[derive(Drop)]
pub struct Rectangle {
    height: u64,
    width: u64,
}

#[executable]
pub fn run_referencias_mutables() {
    let mut rec = Rectangle { height: 3, width: 10 };
    flip(ref rec);
    println!("height: {}, width: {}", rec.height, rec.width);
}

fn flip(ref rec: Rectangle) {
    let temp = rec.height;
    rec.height = rec.width;
    rec.width = temp;
}
//scarb execute --executable-name run_referencias_mutables
//Compiling lib(referencias_instantaneas) referencias_instantaneas
//Compiling executable(run_instantanea) referencias_instantaneas
//Compiling executable(run_referencias_mutables) referencias_instantaneas
//Finished `dev` profile target(s) in 49 seconds
//Executing referencias_instantaneas
//height: 10, width: 3
//Saving output to: target/execute/referencias_instantaneas/execution2

