import Foundation

struct CatCafe: Codable {
    let menu: Menu
}

struct Menu: Codable {
    let burgers, drinks, desserts: [Detail]
}

struct Detail: Codable {
    let name, description: String
    let price: Double
    let image: String?
}

