import UIKit

protocol Mobile {
    var name: String { get }
    func sayMyName()
}

enum Brand {
    case samsung, sony, apple
}

class Samsung: Mobile {
    var name: String {
        return "Samsung"
    }
    
    func sayMyName() {
        print("S7")
    }
}

class Sony: Mobile {
    var name: String {
        return "Sony"
    }
    
    func sayMyName() {
        print("Xperia")
    }
}

class Apple: Mobile {
    var name: String {
        return "Apple"
    }
    
    func sayMyName() {
        print("iPhone")
    }
}

class MobileClient {
    func sayMyName(brand: Brand) {
        let mobile: Mobile
        switch brand {
        case .sony:
            mobile = Sony()
        case .apple:
            mobile = Apple()
        }
        mobile.sayMyName()
    }
}

let test = MobileClient()
test.sayMyName(brand: .sony)

// Neste metodo, da para ver a relacao entre os `marcas` e os `mobiles`, se quissessemos criar um novo tipo de 'marca' de mobile, teriamos que criar outro tipo de marca e outro mobile ao enum
// O problema aqui é se quissessemos usar um mobile em outra parte do projeto, teriamos que duplicar a logica do switch la tambem

// SOLUCAO

// Factory
// Essencialmente, essa função irá encapsular a lógica do switch e criar o Mobile necessário

//class MobileFactory {
//    func createMobile(_ brand: Brand) -> Mobile {
//        let mobile: Mobile
//        switch brand {
//        case .sony:
//            mobile = Sony()
//        case .quiet:
//            mobile = Apple()
//        }
//        return mobile
//    }
//}
//
//class MobileClient {
//    func sayMyName(brand: Brand) {
//        let mobileFactory = MobileFactory() // logica encapsulada
//            .createMobile(brand) // tipo de mobile
//            .sayMyName() // funcao esperada
//    }
//}
//
//let test = MobileClient()
//test.sayMyName(brand: .sony)

// PROS: Com essa mudanca, se fizermos mudanca em Mobile ou Brand, essas alteracoes estarao isolados no nosso Factory e nao no nosso MobileClient, assim MobileClient nao tera necessidade de sofrer alteracao
// Assim temos o beneficio do Open/Closed - Aberto para extensao mas Fechado para modificacoes quando definir novos Mobile ou Brand
