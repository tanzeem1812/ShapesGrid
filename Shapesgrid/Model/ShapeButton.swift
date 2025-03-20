struct ShapeButton: Decodable, Hashable {
    let name: String
    let draw_path: String
}

struct ShapeButtons: Decodable {
    let buttons: [ShapeButton]
}
