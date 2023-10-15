//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Yuga Suzuki on 10/13/23.
//

import Foundation


class TriviaQuestionService {
    static func fetchTrivia(numQuestions: UInt, category: UInt, difficulty: String, type: String, completion: (([TriviaQuestion]) -> Void)? = nil){
        let parameters = "amount=\(numQuestions)&category=\(category)&difficulty=\(difficulty)&type=\(type)"
        let url = URL(string: "https://opentdb.com/api.php?\(parameters)")!
        // create a data task and pass in the URL
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // this closure is fired when the response is received
            guard error == nil else {
                assertionFailure("Error: \(error!.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                assertionFailure("Invalid response")
                return
            }
            guard let data = data, httpResponse.statusCode == 200 else {
                assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                return
            }
            let decoder = JSONDecoder()
            let response = try! decoder.decode(TriviaQuestionResponse.self, from: data)
            DispatchQueue.main.async {
              completion?(response.results)
            }
        }
        task.resume()
    }
    
//    private static func parse(data: Data) -> TriviaQuestionResponse {
//        // transform the data we received into a dictionary [String: Any]
//        let jsonDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//        let category = jsonDictionary["category"] as! UInt
//        let type = jsonDictionary["type"] as! String
//        let difficulty = jsonDictionary["difficulty"] as! String
//        let question = jsonDictionary["question"] as! String
//        let correctAnswer = jsonDictionary["correct_answer"] as! String
//        let incorrectAnswers = jsonDictionary["incorrect_answers"] as! [String]
//
//        return TriviaQuestionResponse(category: category,
//                              type: type,
//                              difficulty: difficulty,
//                              question: question,
//                              correctAnswer: correctAnswer,
//                              incorrectAnswers: incorrectAnswers
//        )
//    }
    
}

