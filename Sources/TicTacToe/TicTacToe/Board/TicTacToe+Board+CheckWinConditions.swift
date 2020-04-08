//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-08.
//

import Foundation

public extension TicTacToe.Board {
    
    func winner() -> Player? {
        func hasPlayerWon(_ player: Player) -> Bool {
            // check 3 rows
            for row in rowsOfColumns {
                if row.allSatisfy({ $0 == player.fill }) {
                    return true
                }
            }
            
            // check 3 columns
            columnLoop: for column in 0..<3 {
                for row in 0..<3 {
                    guard self[row, column] == player.fill else {
                        continue columnLoop
                    }
                }
                return true
            }
            
            // check 2 diagonals
            func check(diagonal: [Index]) -> Bool {
                diagonal.allSatisfy({ self[$0] == player.fill })
            }
            
            if check(diagonal: .mainDiagonal) || check(diagonal: .antiDiagonal) {
                return true
            }
            
            return false
        }
        
        for player in Player.allCases {
            guard hasPlayerWon(player) else {
                continue
            }
            return player
        }
        
        return nil
    }
    
}

private extension Array where Element == TicTacToe.Board.Index {
    /// Main, Major, Principal, Primary; diagonal: ╲
    /// from top left, to bottom right
    static let mainDiagonal: [Element] = [2, 4, 6]
    
    /// Anti-, Minor, Counter, Secondary; diagonal: ╱
    /// from bottom left, to top right
    static let antiDiagonal: [Element] = [0, 4, 8]
}
