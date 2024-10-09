import UIKit

class SignUpView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입"
        label.font = .systemFont(ofSize: 23)
        return label
    }()
  
    let mainImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "profile")
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            return imageView
        }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 0.0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 0.0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.keyboardType = .default
        textField.isSecureTextEntry = true

        let passwordToggle = UIButton(type: .custom)
        passwordToggle.frame = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
        passwordToggle.setImage(UIImage(named: "eye_closed"), for: .normal)
        passwordToggle.setImage(UIImage(named: "eye_open"), for: .selected)
        passwordToggle.imageView?.contentMode = .scaleAspectFit

        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        rightViewContainer.addSubview(passwordToggle)
        textField.rightView = rightViewContainer
        textField.rightViewMode = .always
        
        return textField
    }()
    
    
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 확인"
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 0.0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        
        let passwordToggle = UIButton(type: .custom)
        passwordToggle.frame = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
        passwordToggle.setImage(UIImage(named: "eye_closed"), for: .normal)
        passwordToggle.setImage(UIImage(named: "eye_open"), for: .selected)
        passwordToggle.imageView?.contentMode = .scaleAspectFit

        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        rightViewContainer.addSubview(passwordToggle)
        textField.rightView = rightViewContainer
        textField.rightViewMode = .always
        
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureSubviews()
        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpView {
    private func configureSubviews() {
        [titleLabel, mainImageView, idTextField, passwordTextField, confirmPasswordTextField, signUpButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            mainImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            mainImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            mainImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            idTextField.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            idTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 77),
            idTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 77),
            passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 77),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            signUpButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
