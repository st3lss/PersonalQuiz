//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // Mark: Outlets & values
    
    @IBOutlet var resultAnimalType: UILabel!
    @IBOutlet var resultDescription: UILabel!
    
    var answersChoosen: [Answer] = []
    
    // Mark: Private values
    private var dogAnswers: [Answer] = []
    private var catAnswers: [Answer] = []
    private var rabbitAnswers: [Answer] = []
    private var turtleAnswers: [Answer] = []
    
    // Mark: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNewArrays()
        determineWhoAreYou()
        
        navigationItem.hidesBackButton = true
    }
}


// Mark: Private methods
extension ResultsViewController{
    
    private func createNewArrays() {
        for a in answersChoosen {
            if a.type == PersonalQuiz.AnimalType.dog {
                dogAnswers.append(a)
            } else if a.type == PersonalQuiz.AnimalType.cat {
                catAnswers.append(a)
            } else if a.type == PersonalQuiz.AnimalType.rabbit {
                rabbitAnswers.append(a)
            } else {
                turtleAnswers.append(a)
            }
        }
    }
    
    private func determineWhoAreYou() {
    
        if dogAnswers.count > catAnswers.count && dogAnswers.count > rabbitAnswers.count && dogAnswers.count > turtleAnswers.count {
            resultAnimalType.text = "Вы \(AnimalType.dog.rawValue)"
            resultDescription.text = "\(AnimalType.dog.definition)"
        } else if catAnswers.count > dogAnswers.count && catAnswers.count > rabbitAnswers.count && catAnswers.count > turtleAnswers.count {
            resultAnimalType.text = "Вы \(AnimalType.cat.rawValue)"
            resultDescription.text = "\(AnimalType.cat.definition)"
        } else if rabbitAnswers.count > dogAnswers.count && rabbitAnswers.count > catAnswers.count && rabbitAnswers.count > turtleAnswers.count {
            resultAnimalType.text = "Вы \(AnimalType.rabbit.rawValue)"
            resultDescription.text = "\(AnimalType.rabbit.definition)"
        } else if turtleAnswers.count > dogAnswers.count && turtleAnswers.count > catAnswers.count && turtleAnswers.count > rabbitAnswers.count {
            resultAnimalType.text = "Вы \(AnimalType.turtle.rawValue)"
            resultDescription.text = "\(AnimalType.turtle.definition)"
        } else {
            resultAnimalType.text = ""
            resultDescription.text = "Вы многогранная личность"
        }
    }
}
