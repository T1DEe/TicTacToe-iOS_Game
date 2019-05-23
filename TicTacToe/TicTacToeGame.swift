
import Foundation

class TicTacToeGame {
    private let fieldSize: Int
    private var fieldMatrix: [[Int]]
    private(set) var currentPlayer: Int
    
    init(fieldSize: Int) {
        self.fieldSize = fieldSize
        fieldMatrix = Array(repeating: Array(repeating: 0, count: fieldSize), count: fieldSize)
        currentPlayer = 1
    }
    
    private func isHaveMove() -> Bool {
        for row in fieldMatrix {
            for column in row {
                if column == 0 {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func move(row: Int, column: Int) -> Bool {
        if fieldMatrix[row][column] == 0 {
            fieldMatrix[row][column] = currentPlayer
            return true
        }
        return false
    }
    
    private func changeTurn() -> Int {
        if currentPlayer == 1 {
            currentPlayer = 2
        } else {
            currentPlayer = 1
        }
        
        return currentPlayer
    }
    
    private func checkRows(player: Int) -> Bool {
        var flag = true
        
        for row in fieldMatrix {
            flag = true
            for columnInRow in row {
                if columnInRow != player {
                    flag = false
                    break
                }
            }
            
            if flag == true {
                return true
            }
        }
        
        return false
    }
    
    private func checkColumns(player: Int) -> Bool {
        var flag = true
        
        for column in fieldMatrix.indices {
            flag = true
            for indexInRow in fieldMatrix.indices {
                if fieldMatrix[indexInRow][column] != player {
                    flag = false
                    break
                }
            }
            
            if flag == true {
                return true
            }
        }
        
        return false
    }
    
    private func checkDiagonals(player: Int) -> Bool {
        var flag = true
        
        // checking first diagonal
        for index in fieldMatrix.indices {
            flag = true
                if fieldMatrix[index][index] != player {
                    flag = false
                    break
                }
        }
        if flag == true {
            return true
        }
        
        
        // checking second diagonal
        for index in fieldMatrix.indices {
            flag = true
            if fieldMatrix[index][(fieldMatrix.count-1) - index] != player {
                flag = false
                break
            }
        }
        if flag == true {
            return true
        }
        
        return false
    }
    
    func checkField() -> Int {
        if checkRows(player: currentPlayer) || checkColumns(player: currentPlayer) || checkDiagonals(player: currentPlayer) {
            return currentPlayer
        } else if isHaveMove() == false {
            return 0
        } else {
            return -1
        }
    }
}
