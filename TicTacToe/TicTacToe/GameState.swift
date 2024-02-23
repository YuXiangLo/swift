import Foundation

class GameState: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Nought
    @Published var noughtScore = 0
    @Published var crossScore = 0
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    init() {
        resetBoard()
    }
    
    func turnText() -> String {
        return turn == Tile.Cross ? "Turn: Cross" : "Turn: Nought"
    }
    
    func checkVictory() -> Bool {
        if (isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2) ||
            isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0)){
            return true
        }
        for i in 0...2 {
            if (isTurnTile(i, 0) && isTurnTile(i, 1) && isTurnTile(i, 2) ||
                isTurnTile(0, i) && isTurnTile(1, i) && isTurnTile(2, i)) {
                return true
            }
        }
        return false
    }
    
    func checkDraw() -> Bool {
        for i in 0...2 {
            for j in 0...2 {
                if (board[i][j].tile == Tile.Empty) {
                    return false
                }
            }
        }
        return true
    }
    
    func isTurnTile(_ row: Int, _ column: Int) -> Bool {
        return board[row][column].tile == turn
    }
    
    func placeTile(_ row: Int, _ column: Int) {
        if (board[row][column].tile != Tile.Empty) {
            return
        }
        
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        
        if (checkVictory()) {
            if (turn == Tile.Cross) {
                crossScore += 1
            } else {
                noughtScore += 1
            }
            let winner = turn == Tile.Cross ? "Cross" : "Nought"
            alertMessage = "Winner is " + winner
            showAlert = true
        } else if (checkDraw()){
            alertMessage = "Draw!"
            showAlert = true
        }
        
        turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
    }
    
    func resetBoard() {
        showAlert = false
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
