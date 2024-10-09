import UIKit

class SignUpViewController: UIViewController {
    let signUpView = SignUpView()
    
    override func loadView() {
        view = signUpView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureAddTarget()
        setupPasswordToggle()
    }
}

extension SignUpViewController {
    private func configureInitialSetting() {
        signUpView.idTextField.delegate = self
        signUpView.passwordTextField.delegate = self
        signUpView.confirmPasswordTextField.delegate = self

    }
}

extension SignUpViewController{
    private func configureAddTarget() {
        signUpView.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    @objc func didTapSignUpButton() {
        popToLoginVC()
    }
    
    func popToLoginVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupPasswordToggle() {
        if let passwordToggle = signUpView.passwordTextField.rightView?.subviews.first as? UIButton {
            passwordToggle.addTarget(self, action: #selector(didTapPasswordToggle), for: .touchUpInside)
        }
        if let confirmpasswordToggle = signUpView.confirmPasswordTextField.rightView?.subviews.first as? UIButton {
            confirmpasswordToggle.addTarget(self, action: #selector(didTapConfirmPasswordToggle), for: .touchUpInside)
        }
    }
        
    @objc private func didTapPasswordToggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        signUpView.passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc private func didTapConfirmPasswordToggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        signUpView.confirmPasswordTextField.isSecureTextEntry.toggle()
    }
    
    // 로그인 후 화면
    func pushNextVC() {
        
    }
}

extension SignUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if signUpView.idTextField.text != "", signUpView.passwordTextField.text != "" {
            signUpView.passwordTextField.resignFirstResponder()
            pushNextVC()
            return true
        } else if signUpView.idTextField.text != "" {
            signUpView.passwordTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        signUpView.idTextField.resignFirstResponder()
        signUpView.passwordTextField.resignFirstResponder()
    }
}
