//
//  ContentView.swift
//  TicTacToe
//
//  Created by 羅煜翔 on 2024/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    
    var body: some View {
        let borderSize = CGFloat(6)
        
        Text(gameState.turnText())
            .font(.title)
            .bold()
            .padding()
        
        Text(String(format: "Nought: %d", gameState.noughtScore))
            .font(.title)
            .bold()
            .padding()
        
        
        VStack(spacing: borderSize) {
            ForEach(0...2, id: \.self) {
                row in HStack(spacing: borderSize) {
                    ForEach(0...2, id: \.self) {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .bold()
                            .foregroundColor(cell.tileColor())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $gameState.showAlert) {
            Alert(
                title: Text(gameState.alertMessage),
                dismissButton: .default(Text("Okay")) {
                    gameState.resetBoard()
                }
            )
        }
        Text(String(format: "Cross: %d", gameState.crossScore))
            .font(.title)
            .bold()
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
