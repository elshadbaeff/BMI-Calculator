//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Elshad Babaev on 04.08.2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "calculate_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = UIColor(red: 98/255, green: 96/255, blue: 157/255, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let weight: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let height: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.minimumTrackTintColor = UIColor(red: 116/255, green: 114/255, blue: 210/255, alpha: 1)
        slider.maximumTrackTintColor = .darkGray
        slider.thumbTintColor = UIColor(red: 116/255, green: 114/255, blue: 210/255, alpha: 1)
        slider.addTarget(self, action: #selector(heightSliderChanged), for: .touchUpInside)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let weightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 250
        slider.minimumTrackTintColor = UIColor(red: 116/255, green: 114/255, blue: 210/255, alpha: 1)
        slider.maximumTrackTintColor = .darkGray
        slider.thumbTintColor = UIColor(red: 116/255, green: 114/255, blue: 210/255, alpha: 1)
        slider.addTarget(self, action: #selector(weightSliderChanged), for: .touchUpInside)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bmiLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCUlATE YOUR BMI"
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 1.5
        weightSlider.value = 125
        
        view.addSubview(backgroundImage)
        view.addSubview(calculateButton)
        view.addSubview(heightSlider)
        view.addSubview(weightSlider)
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
        view.addSubview(height)
        view.addSubview(weight)
        view.addSubview(bmiLabel)
        
        
        
        
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            calculateButton.widthAnchor.constraint(equalToConstant: 350),
            calculateButton.heightAnchor.constraint(equalToConstant: 75),
            
            heightSlider.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -15),
            heightSlider.widthAnchor.constraint(equalToConstant: 350),
            heightSlider.heightAnchor.constraint(equalToConstant: 51),
            heightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            weightSlider.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -25),
            weightSlider.widthAnchor.constraint(equalToConstant: 350),
            weightSlider.heightAnchor.constraint(equalToConstant: 51),
            weightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            height.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            height.bottomAnchor.constraint(equalTo: heightSlider.topAnchor),
            
            weight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weight.bottomAnchor.constraint(equalTo: weightSlider.topAnchor),
            
            heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            heightLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor),
            
            weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weightLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor),
            
            bmiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bmiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bmiLabel.heightAnchor.constraint(equalToConstant: 150),
            bmiLabel.widthAnchor.constraint(equalToConstant: 150)
            
            
            
        
        
        
        ])
    }

    @objc func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @objc func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @objc func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value

        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        let vc = ResultViewController()
        vc.bmiValue = calculatorBrain.getBMIValue()
        vc.advice = calculatorBrain.getAdvice()
        vc.color = calculatorBrain.getColor()
        
        present(vc, animated: true)
        
        
    }

}

