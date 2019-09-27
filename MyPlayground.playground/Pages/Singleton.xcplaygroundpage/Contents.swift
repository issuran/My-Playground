import UIKit

class NetworkClient {
    func fetchUsers() {
        // Fetch users
    }
    
    func fetchMessages() {
        // Fetch messages
    }
}


let networkClient1 = NetworkClient()
let networkClient2 = NetworkClient()


// Podemos criar varias instancias de network dessa forma, mas queremos centralizar todas elas para que sejam tratadas apenas em um lugar

// Usando singleton garantimos que havera apenas uma instancia

// Como?

// Em Swift 2 passos:
// 1-Declarar uma propriedade static
// 2-Modificar o construtor para privado

let static shared = NetworkClient()

// se voce ver shared é um grande sinal de que tal classe seja um singleton:
Singleton Naming Conventions:
- UIApplication.shared
- UserDefaults.standard
- FileManager.default

//mesmo declarando a variavel static, ainda conseguimos declarar outras instancias de NetworkClient()
// Para resolver isso, temos o segundo passo, modificar o construtor para garantir que apenas a propria classe tem acesso a funcao de criar
// Assim se voce tentar criar uma nova instancia, voce vai ter um erro
