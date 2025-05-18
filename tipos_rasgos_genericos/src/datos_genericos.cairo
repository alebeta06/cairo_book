// Definimos un trait para la funcionalidad común de Wallet
trait WalletTrait<T> {
    fn print_info(self: @Wallet<T>);
}

// Definimos una estructura genérica Wallet
#[derive(Copy, Drop)]
struct Wallet<T> {
    balance: T,
    owner: felt252,
}

// Implementación del trait para Wallet<u32>
impl WalletImpl of WalletTrait<u32> {
    fn print_info(self: @Wallet<u32>) {
        println!("Wallet Info");
        println!("Owner: {}", self.owner);
        println!("Balance: {}", self.balance);
    }
}

// Implementación del trait para Wallet<bool>
impl WalletBoolImpl of WalletTrait<bool> {
    fn print_info(self: @Wallet<bool>) {
        println!("Wallet Info");
        println!("Owner: {}", self.owner);
        println!("Balance: {}", self.balance);
    }
}

// Función para encontrar la wallet con mayor balance
fn largest_balance(w1: @Wallet<u32>, w2: @Wallet<u32>) -> Wallet<u32> {
    if w1.balance > w2.balance {
        *w1
    } else {
        *w2
    }
}

// Función principal del programa
#[executable]
fn main() {
    // Creamos dos wallets con balance u32
    let wallet1: Wallet<u32> = Wallet { balance: 100_u32, owner: 123 };
    let wallet2: Wallet<u32> = Wallet { balance: 200_u32, owner: 456 };

    println!("Wallet 1:");
    WalletImpl::print_info(@wallet1);
    println!("Wallet 2:");
    WalletImpl::print_info(@wallet2);

    // Encontramos la wallet con mayor balance
    let largest = largest_balance(@wallet1, @wallet2);
    println!("Wallet con mayor balance:");
    WalletImpl::print_info(@largest);

    // Creamos wallets con balance booleano
    let wallet3: Wallet<bool> = Wallet { balance: true, owner: 789 };
    let wallet4: Wallet<bool> = Wallet { balance: false, owner: 101 };

    println!("Wallet 3 (boolean):");
    WalletBoolImpl::print_info(@wallet3);
    println!("Wallet 4 (boolean):");
    WalletBoolImpl::print_info(@wallet4);
}
