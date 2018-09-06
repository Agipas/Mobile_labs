import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBAction func sayButton(_ sender: UIButton) {
        isValidName(firstName: firstNameTextField.text!)
        isValidSecondName(secondName: secondNameTextField.text!)
        isValidEmail(emailAddressString: emailTextField.text!)
        isValidPhone(number: phoneTextField.text!)
        isValidPassword(password: passwordTextField.text!)
        isPasswordSame(password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!)
    }

    func isValidName(firstName: String) {
        let firstNameRegex = "[a-zA-Z]{1,30}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", firstNameRegex)
        let result = nameTest.evaluate(with: firstName)
        changeColor(textFieldName: firstNameTextField, isvalid: result)
    }

    func isValidSecondName(secondName: String) {
        let secondNameRegex = "[a-zA-Z]{1,30}"
        let secondNameTest = NSPredicate(format: "SELF MATCHES %@", secondNameRegex)
        let result = secondNameTest.evaluate(with: secondName)
        changeColor(textFieldName: secondNameTextField, isvalid: result)
    }
    func isValidEmail(emailAddressString: String) {
        let emailRegex = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let result = emailTest.evaluate(with: emailAddressString)
        changeColor(textFieldName: emailTextField, isvalid: result)
    }

    func isValidPhone(number: String) {
        let phoneRegex = "^((\\+){0,1})[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result = phoneTest.evaluate(with: number)
        changeColor(textFieldName: phoneTextField, isvalid: result)
    }

    func isValidPassword(password: String) {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,20}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let result = passwordTest.evaluate(with: password)
        changeColor(textFieldName: passwordTextField, isvalid: result)
    }

    func isPasswordSame(password: String, confirmPassword: String) {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,20}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let result = passwordTest.evaluate(with: confirmPassword)
        changeColor(textFieldName: confirmPasswordTextField, isvalid: result)
    }

    func changeColor(textFieldName: UITextField, isvalid: Bool) {
        textFieldName.layer.borderWidth = 0.8
        textFieldName.layer.cornerRadius = 5.0
        if isvalid {
            textFieldName.layer.borderColor = UIColor.clear.cgColor
        }
        else {
            textFieldName.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

