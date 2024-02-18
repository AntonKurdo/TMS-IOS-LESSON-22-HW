import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let cityArray = ["Minsk", "Vitebsk", "Grodno", "Mogilev", "Brest", "Gomel"]
    }
    
    var button: UIButton!
    
    var label: UILabel!
    
    var imageView: UIImageView!
    
    var infoPopup = Constuctor.createInfoPopup()
    
    lazy var pickerView: UIView = Constuctor.createPickerView(vc: self)
    
    var selectedCityIndex = 0 {
        didSet {
            label.text = Constants.cityArray[selectedCityIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupPopup()
        setupLabel()
        setupImageView()
        
        view.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height / 2),
            pickerView.topAnchor.constraint(equalTo: view.bottomAnchor),
            pickerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setupButton() {
        button = Constuctor.createButton(title: "Press me")
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        let buttonAction = UIAction {_ in
            self.showAlertMessage(title: "Title", message: "Message") {_ in
                UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut) {
                    self.infoPopup.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 75, y: 70, width: 150, height: 45)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut) {
                            self.infoPopup.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 75, y: -45, width: 150, height: 45)
                            
                        }
                    }
                }
            }
        }
        
        button.addAction(buttonAction, for: .touchUpInside)
    }
    
    private func setupPopup() {
        label = Constuctor.createLabel(title: "")
        
        view.addSubview(infoPopup)
    }
    
    private func setupLabel() {
        view.addSubview(label)
        label.text = Constants.cityArray[selectedCityIndex]
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
        ])
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        
        label.addGestureRecognizer(gesture)
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 25)
        
    }
    
    private func setupImageView() {
        imageView = Constuctor.createImageView()
        view.addSubview(imageView)
        imageView.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 45, y: 130, width: 90, height: 90)
        
        let gestureHandler = UITapGestureRecognizer(target: self, action: #selector(pickPhotoButtonTapped))
        imageView.addGestureRecognizer(gestureHandler)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil)
    {
        
        UIView.animate(withDuration: 0.314) {
            self.pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 2.5, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
        }
        
    }
    
    @objc private func pickPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
}


