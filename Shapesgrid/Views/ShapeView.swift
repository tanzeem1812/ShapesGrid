import SwiftUI

protocol ShapeView {
    var id: UUID { get }
    var view: AnyView { get }
}
