//
//  ViewController.swift
//  McQuiz
//
//  Created by Luka Leko on 2023-03-05.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var questionResult = false
    
    var quizBrain = QuizBrain()
    lazy var question = quizBrain.quiz[0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text
        
        questionResult = quizBrain.checkAnswer(userAnswer!)
        questionResult ? (sender.backgroundColor = UIColor.green) : (sender.backgroundColor = UIColor.red)
        scoreLabel.text = "Score: \(quizBrain.score)"
        
        quizBrain.nextQuestion()
        question = quizBrain.quiz[quizBrain.questionNumber]
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.score)"
        questionLabel.text = question.text
        answer1.setTitle(question.answer[0], for:.normal)
        answer2.setTitle(question.answer[1], for:.normal)
        answer3.setTitle(question.answer[2], for:.normal)
        answer1.backgroundColor = UIColor.clear
        answer2.backgroundColor = UIColor.clear
        answer3.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
}

