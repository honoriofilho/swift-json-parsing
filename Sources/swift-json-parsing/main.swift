// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// Defina a struct
struct Person: Codable {
    var name: String
    var age: Int
}

// Caminho para salvar o arquivo JSON
let fileURL = URL(fileURLWithPath: "/home/person.json")

func saveData(_ path:URL){
    // Instância da struct
    let person = Person(name: "João", age: 30)

    // Crie um objeto JSONEncoder
    let encoder = JSONEncoder()

    // Codificar a struct para JSON Data
    do {
        let jsonData = try encoder.encode(person)

        // Converta JSON Data em String (opcional)
        if let jsonString = String(data: jsonData, encoding: .utf8) {

            // Gravar dados JSON no arquivo
            try jsonData.write(to: path)

        }
    } catch {
        print("Erro ao codificar a struct para JSON: \(error)")
    }
}

func readData(_ path:URL){
    do {
        // Ler os dados JSON do arquivo
        let jsonData = try Data(contentsOf: path)

        // Crie um objeto JSONDecoder
        let decoder = JSONDecoder()

        // Decodificar os dados JSON em uma instância da struct Person
        let person = try decoder.decode(Person.self, from: jsonData)

        // Imprimir os dados da pessoa
        print("Nome: \(person.name)")
        print("Idade: \(person.age)")

    } catch {
        print("Erro ao ler o arquivo JSON: \(error)")
    }
}

saveData(fileURL)
readData(fileURL)