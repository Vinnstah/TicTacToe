//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-08.
//

import Foundation

public enum Player: UInt8, Equatable, CaseIterable {
    case playerX
    case playerO
}

public extension Player {
    mutating func toggle() {
        self = Self(rawValue: (rawValue + 1) % 2)!
        //Vad gör denna funktionen? Om den togglar mellan spelarna varför plussar vi ett värde med 1 och tar mod 2 av det?
    }
    
    var fill: TicTacToe.Board.Fill {
        switch self {
        case .playerO: return .nought
        case .playerX: return.cross
        }
    }
}
