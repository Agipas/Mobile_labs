import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet fileprivate weak var listButton: UIButton!

    @IBAction func clearDataButton(_ sender: UIButton) {
        if isKeyPresentInUserDefaults(){
            UserDefaults.standard.removeObject(forKey: "places")
        }
    }
    
    @IBAction func sayButton(_ sender: UIButton) {
        sendDataifValid();
       
    }
    
    func sendDataifValid() {
        if (isValidName(firstName: firstNameTextField.text!) &&
            isValidSecondName(secondName: secondNameTextField.text!) &&
            isValidEmail(emailAddressString: emailTextField.text!) &&
            isValidPhone(number: phoneTextField.text!) &&
            isValidPassword(password: passwordTextField.text!) &&
            isPasswordSame(password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!)) == true {
            submitData();
            cleanFields();
       listButton.sendActions(for: .touchUpInside);
        }
    }
    
    func isValidName(firstName: String) -> Bool {
        let firstNameRegex = "[a-zA-Z]{1,30}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", firstNameRegex)
        let result = nameTest.evaluate(with: firstName)
        changeColor(textFieldName: firstNameTextField, isvalid: result)
        return result
    }

    func isValidSecondName(secondName: String) -> Bool{
        let secondNameRegex = "[a-zA-Z]{1,30}"
        let secondNameTest = NSPredicate(format: "SELF MATCHES %@", secondNameRegex)
        let result = secondNameTest.evaluate(with: secondName)
        changeColor(textFieldName: secondNameTextField, isvalid: result)
        return result
    }
    func isValidEmail(emailAddressString: String) -> Bool{
        let emailRegex = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let result = emailTest.evaluate(with: emailAddressString)
        changeColor(textFieldName: emailTextField, isvalid: result)
        return result
    }

    func isValidPhone(number: String) -> Bool{
        let phoneRegex = "^((\\+){0,1})[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result = phoneTest.evaluate(with: number)
        changeColor(textFieldName: phoneTextField, isvalid: result)
        return result
    }

    func isValidPassword(password: String) -> Bool{
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,20}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let result = passwordTest.evaluate(with: password)
        changeColor(textFieldName: passwordTextField, isvalid: result)
        return result
    }

    func isPasswordSame(password: String, confirmPassword: String) -> Bool{
        var result:Bool = true
        if password == confirmPassword {
            result = true
        } else {
            changeColor(textFieldName: confirmPasswordTextField, isvalid: result)
        }
        return result
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
    
    func submitData() {
        if isKeyPresentInUserDefaults() {
            let place1 = Person(firstName : firstNameTextField.text!, secondName : secondNameTextField.text! ,phoneNumber : Int(phoneTextField.text! )!)
            var savedArray = ViewController.getPlaces()
            savedArray.append(place1)
            let placesData = try! JSONEncoder().encode(savedArray)
            UserDefaults.standard.removeObject(forKey: "places")
            UserDefaults.standard.set(placesData, forKey: "places")
            UserDefaults.standard.synchronize()
        }
        else if (isKeyPresentInUserDefaults() != true){
            var placeArray = [Person]()
            let place1 = Person(firstName : firstNameTextField.text!, secondName : secondNameTextField.text! ,phoneNumber : Int(phoneTextField.text! )!)
            placeArray.append(place1)
            let placesData = try! JSONEncoder().encode(placeArray)
            UserDefaults.standard.set(placesData, forKey: "places")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: "places") != nil
    }
    
    public static func getPlaces() -> [Person] {
        let placeData = UserDefaults.standard.data(forKey: "places")
        let placeArray = try? JSONDecoder().decode([Person].self, from: placeData!)
        return placeArray!
    }
    
    func cleanFields() {
        firstNameTextField.text = nil
        secondNameTextField.text = nil
        emailTextField.text = nil
        phoneTextField.text = nil
        passwordTextField.text = nil
        confirmPasswordTextField.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
class Person: Codable {
    var firstName: String
    var secondName: String
    var phoneNumber: Int
    
    init(firstName : String, secondName : String,phoneNumber : Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.phoneNumber = phoneNumber
    }
}
