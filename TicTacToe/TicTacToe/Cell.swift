import Foundation
import SwiftUI

enum Tile {
    case Nought
    case Cross
    case Empty
}

struct Cell {
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile) {
            case Tile.Nought:
                return "O"
            case Tile.Cross:
                return "X"
            default:
                return ""
        }
    }
    
    func tileColor() -> Color {
        switch(tile) {
            case Tile.Nought:
                return Color.red
            case Tile.Cross:
                return Color.black
            default:
                return Color.black
        }
    }
}
