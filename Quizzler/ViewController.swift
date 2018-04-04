//
//  ViewController.swift
//  Quizzler
//


import UIKit

class ViewController: UIViewController {
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNum : Int = 0
    var score : Int = 0
    
    //look at model folder to understand this more
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //first question is the first question on the list
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        //gets the tag from button for true or false
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
           pickedAnswer = false
        }
        //answer func is returned
        checkAnswer()
        
        //increases question number and goes to next question
        questionNum = questionNum + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNum + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNum + 1)
    }
    

    func nextQuestion() {
        if questionNum <= 12 {
        questionLabel.text = allQuestions.list[questionNum].questionText
            
        updateUI()
        }
        else{
            let alert = UIAlertController(title: "Great job!", message: "You have come to the end of the quiz, would you like to start over?", preferredStyle: .alert)
            let restart = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
                })
            
            alert.addAction(restart)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNum].answer
        
        if correctAnswer == pickedAnswer{
            print("right ")
            score += 1
        }
        else {
            print("wrong")
        }
    }
    
    func startOver() {
        score = 0
        questionNum = 0
        nextQuestion()
        
    }
    
}
