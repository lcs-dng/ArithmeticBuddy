//
//  AdditionView.swift
//  ArithmeticBuddy
//
//  Created by Dexter Ng on 2024-02-03.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // The two numbers the user must add
    @State var firstNumber = Int.random(in: 1...25)
    @State var secondNumber = Int.random(in: 1...25)
    
    // What number the user has guessed
    @State var givenInput = ""
    
    // MARK: Computed properties
    
    // The correct sum of the randomly generated numbers
    var correctSum: Int {
        return firstNumber + secondNumber
    }
    
    // Feedback to the user
    @State var feedback = ""
    
    // The user interface
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack {
                Spacer()
                Text("\(firstNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            HStack {
                Text("+")
                    .font(Font.system(size: 50))
                Spacer()
                Text("\(secondNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
                        
            Divider()
            
            TextField("Enter the sum", text: $givenInput)
                .font(.system(size: 50))
                .multilineTextAlignment(.trailing)
            
            Spacer()
            
            Button {
                checkAnswer()
            } label: {
                Text("Check Answer")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Text(feedback)
                .font(
                    .custom(
                        "BradleyHandITCTT-Bold",
                        size: 24.0,
                        relativeTo: .title3
                    )
                )
            
            Spacer()
            
            Button {
                reset()
            } label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    // MARK: Functions
    
    // Check whether the user's answer was correct
    // Provide appropriate feedback
    func checkAnswer() {
        
        // Attempt to unwrap the input provided by the user
        guard let selectedNumber = Int(givenInput) else {
            feedback = "Please provide an integer."
            return
        }
        
        if selectedNumber != correctSum {
            feedback = "Try again."
        } else {
            feedback = "Good job pal!"
        }
        
    }
    
    // Reset for a new question
    func reset() {
        
        firstNumber = Int.random(in: 1...25)
        secondNumber = Int.random(in: 1...25)
        feedback = ""
        givenInput = ""
        
    }
}

#Preview {
    AdditionView()
}
