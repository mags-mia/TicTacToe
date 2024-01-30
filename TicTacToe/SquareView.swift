//
//  SquareView.swift: the SquareView struct is a SwiftUI view that represents an individual square on the game board. It takes a Square object and an action closure as inputs. When the square is tapped, it triggers the provided action. The view updates its appearance based on the status of the Square it represents (empty, containing an X or an O, or highlighted when part of a winning line).
//  TicTacToe
//
//  Created by null on 05/09/2023.
//

import Foundation
import SwiftUI

enum SquareStatus {
    case empty
    case x
    case o
    case xw
    case ow
}

class Square : ObservableObject {
    @Published var squareStatus : SquareStatus
    
    init(status: SquareStatus) {
        self.squareStatus = status
    }
}

struct SquareView : View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var dataSouce : Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSouce.squareStatus == .x || self.dataSouce.squareStatus == .xw ?
                 "X" : self.dataSouce.squareStatus == .o || self.dataSouce.squareStatus == .ow ? "O" : " ")
            .font(.system(size: 60))
            .bold()
            .foregroundColor(self.dataSouce.squareStatus == .xw || self.dataSouce.squareStatus == .ow ? (Color.green.opacity(0.9)) : (colorScheme == .dark ? Color.white.opacity(0.9) : Color.black.opacity(0.9)))
            .frame(width: 90, height: 90, alignment: .center)
            .background(colorScheme == .dark ? Color.white.opacity(0.3).cornerRadius(10) : Color.gray.opacity(0.3).cornerRadius(10))
            .padding(4)
        })
    }
}
