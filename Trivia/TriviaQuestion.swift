//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation


struct TriviaQuestion: Decodable {
  let category: String
  let type: String
  let difficulty: String
  let question: String
  let correctAnswer: String
  let incorrectAnswers: [String]
    
  private enum CodingKeys: String, CodingKey {
    case category = "category"
    case type = "type"
    case difficulty = "difficulty"
    case question = "question"
    case correctAnswer = "correct_answer"
    case incorrectAnswers = "incorrect_answers"
  }

}


