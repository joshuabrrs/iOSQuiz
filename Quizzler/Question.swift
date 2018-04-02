//
//  Question.swift
//  Quizzler
//
//  Created by Joshua Barrios on 3/31/18.
//

import Foundation

class Question{
    
    let questionText : String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
