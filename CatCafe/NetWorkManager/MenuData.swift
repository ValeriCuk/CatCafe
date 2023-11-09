import Foundation

//struct Welcome: Codable {
//    let restaurant: String
//    let menu: [Menu]
//}
//
//struct Menu: Codable {
//    let item: String
//    let description: String
//    let price: Double
//    let imageURL: String?
//}


// MARK: - CatCafe
struct CatCafe: Codable {
    let menu: Menu
}

// MARK: - Menu
struct Menu: Codable {
    let burgers, drinks, desserts: [Burger]
}

// MARK: - Burger
struct Burger: Codable {
    let name, description: String
    let price: Double
    let image: String?
}
