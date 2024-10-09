import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureAddTarget()
        setupPasswordToggle()
    }
}

extension LoginViewController {
    private func configureInitialSetting() {
        loginView.idTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
}

extension LoginViewController{
    private func configureAddTarget() {
        loginView.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    @objc func didTapSignUpButton() {
        pushSignUpVC()
    }
    
    func pushSignUpVC() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    private func setupPasswordToggle() {
        if let passwordToggle = loginView.passwordTextField.rightView?.subviews.first as? UIButton {
            passwordToggle.addTarget(self, action: #selector(didTapPasswordToggle), for: .touchUpInside)
        }
    }
        
    @objc private func didTapPasswordToggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        loginView.passwordTextField.isSecureTextEntry.toggle()
    }
    
    // 로그인 후 화면
    func pushNextVC() {
        
    }
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if loginView.idTextField.text != "", loginView.passwordTextField.text != "" {
            loginView.passwordTextField.resignFirstResponder()
            pushNextVC()
            return true
        } else if loginView.idTextField.text != "" {
            loginView.passwordTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginView.idTextField.resignFirstResponder()
        loginView.passwordTextField.resignFirstResponder()
    }
}
