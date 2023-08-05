import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
        
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "result_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
            
    }()
        
    let verticalSV: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 15
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    let bmiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "BMI"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let adviceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "YOUR RESULT"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitle("RECALCULATE", for: .normal)
        button.backgroundColor = UIColor(red: 123/255, green: 74/255, blue: 109/255, alpha: 1)
        button.tintColor = .white
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        view.addSubview(verticalSV)
        verticalSV.addArrangedSubview(resultLabel)
        verticalSV.addArrangedSubview(bmiLabel)
        verticalSV.addArrangedSubview(adviceLabel)
        view.addSubview(recalculateButton)

        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
            
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
            recalculateButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            recalculateButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 75),
                
            verticalSV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalSV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
        ])
    }
        
    @objc func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
