//
//  ContentView.swift
//  MathGame2
//
//  Created by 羅煜翔 on 2024/2/22.
//

import SwiftUI

struct ContentView: View {
    @State private var correctAnswer = 0
    @State private var choiceArray : [Int] = [0, 1, 2, 3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 100
    @State private var score = 0
    
    
    var body: some View {
        VStack {
            Text("\(firstNumber) + \(secondNumber)")
                .font(.largeTitle)
                .bold()
            HStack {
                ForEach(0..<2) { Index in
                    Button {
                        ansIsCorrect(answer: choiceArray[Index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[Index])
                    }
                }
            }
            HStack {
                ForEach(2..<4) { Index in
                    Button {
                        ansIsCorrect(answer: choiceArray[Index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[Index])
                    }
                }
            }
            
            Text("Score: \(score)")
        }.onAppear(perform: generateAnswers)
        
        
    }
    
    func ansIsCorrect(answer: Int) {
        let isCorrect = answer == correctAnswer
        if isCorrect {
            self.score += 1
        } else {
            self.score -= 1
        }
    }
    
    func generateAnswers() {
        firstNumber = Int.random(in: 0...(difficulty / 2))
        secondNumber = Int.random(in: 0...(difficulty / 2))
        var answerList = [Int]()
        correctAnswer = firstNumber + secondNumber

        for _ in 0...2 {
            answerList.append(Int.random(in: 0...difficulty))
        }
        
        answerList.append(correctAnswer)
        choiceArray = answerList.shuffled()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
