//
//  ViewController.swift
//  RandAnimFacts
//
//  Created by FarizShukri  on 16/07/2024.
//

import UIKit

class ViewController: UIViewController {

    // Array of animal facts
    let animalFacts = [
        "A group of flamingos is called a 'flamboyance'.",
        "An octopus has three hearts.",
        "Honey never spoils. Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still edible.",
        "A snail can sleep for three years.",
        "Elephants are the only animals that can't jump.",
        "A rhinoceros' horn is made of hair.",
        "The fingerprints of a koala are so indistinguishable from humans that they have on occasion been confused at a crime scene.",
        "A shrimp's heart is in its head.",
        "Slugs have four noses.",
        "Dolphins have names for each other."
    ]

    // Label to display the fact
    var factLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the label
        factLabel = UILabel()
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        factLabel.numberOfLines = 0
        factLabel.textAlignment = .center
        factLabel.text = "Tap the button to learn an animal fact!"
        self.view.addSubview(factLabel)

        // Set up the button
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Animal Fact", for: .normal)
        button.addTarget(self, action: #selector(showRandomFact), for: .touchUpInside)
        self.view.addSubview(button)

        // Set up constraints
        NSLayoutConstraint.activate([
            factLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            factLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            factLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            factLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func showRandomFact() {
        // Pick a random fact
        let randomIndex = Int(arc4random_uniform(UInt32(animalFacts.count)))
        let randomFact = animalFacts[randomIndex]
        
        // Update the label
        factLabel.text = randomFact
    }
}


