//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation


struct TriviaQuestionResponse: Decodable {
    let results: [TriviaQuestion]
    
    private enum CodingKeys: String, CodingKey {
      case results = "results"
    }

}
