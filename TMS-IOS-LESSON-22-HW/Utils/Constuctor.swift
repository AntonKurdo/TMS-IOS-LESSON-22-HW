import UIKit

class Constuctor {
    static func createButton(title: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func createLabel(title: String) -> UILabel {
        let label = UILabel()
        
        label.text = title
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "camera.on.rectangle")
        imageView.layer.cornerRadius = 45
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        
        return imageView
    }
    
    static func createInfoPopup() -> UIView {
        let view = UIView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 75, y: -45, width: 150, height: 45))
        let label = UILabel()
        
        label.frame.size = CGSize(width: 100, height: 30)
        label.text = "Thank You!!!"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 22.5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    static func createPickerView(vc: UIPickerViewDelegate & UIPickerViewDataSource) -> UIView {
        
        let pickerView = UIView()
        let picker = UIPickerView()
        let closeButton = UIButton()
        
        pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
        pickerView.backgroundColor = .lightText
        
        pickerView.layer.shadowColor = UIColor.black.cgColor
        pickerView.layer.shadowOpacity = 1
        pickerView.layer.shadowOffset = .zero
        pickerView.layer.shadowRadius = 10
        
        picker.delegate = vc
        picker.dataSource = vc
        
        let systemImage = UIImage(systemName: "xmark.circle.fill") ;
        closeButton.setImage(systemImage, for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.tintColor = .black
        closeButton.isPointerInteractionEnabled = true
        pickerView.addSubview(picker)
        pickerView.addSubview(closeButton)
        picker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            picker.centerXAnchor.constraint(equalTo: pickerView.centerXAnchor),
            picker.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor),
            closeButton.rightAnchor.constraint(equalTo: pickerView.rightAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: pickerView.topAnchor, constant: 16)
        ])
        
        closeButton.addAction(UIAction {_ in
            UIView.animate(withDuration: 0.314) {
                pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
            }
            
        }, for: .touchUpInside)
        return pickerView
        
    }
}
