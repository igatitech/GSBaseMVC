//
//  LoginVC.swift
//  GSBaseMVC
//
//  Created by Gati on 29/01/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var scrollViewLogin : UIScrollView!
    @IBOutlet weak var viewContent : UIView!
    @IBOutlet weak var textFieldEmail : UITextField!
    @IBOutlet weak var textFieldPassword : UITextField!
    @IBOutlet weak var buttonLogin : UIButton!
    
    //MARK:- Variables
    var login : Login?
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.title = StringConstant.Login.login
        setUpTextFields(textFields: [textFieldEmail, textFieldPassword], placeholders: [StringConstant.Login.email, StringConstant.Login.password])
        buttonLogin.setUpButton(title: StringConstant.Login.login, titleColor: .white, font: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Medium), backgroundColor: .black, cornerRadius: buttonCornerRadius)
    }
    
    //MARK:- Navigations
    func pushToMainTableScreen() {
        guard let vcMainTable = GetViewController(StoryBoard: .Authentication, Identifier: .MainTVC) else {
            return
        }
        let navController = UINavigationController(rootViewController: vcMainTable)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    //MARK:- IBActions
    @IBAction func buttonLoginClicked(_ sender : Any) {
        if isValidate() {
            callLoginAPI()
            /*Temporary Navigation to Main Table Screen*/
            saveBoolToDefaults(bool: true, key: .isUserLogin)
            pushToMainTableScreen()
        }
    }
    
    //MARK:- API Call
    func getLoginAPIParameters() -> [String : Any] {
        return [ApiKeys.email : textFieldEmail.text ?? "", ApiKeys.password : textFieldPassword.text ?? "", ApiKeys.device_type : 2, ApiKeys.device_token : deviceTokenString]
    }
    
    func callLoginAPI() {
        NetworkManager.request(showloader: true, url: .Login, method: .post, parameters: getLoginAPIParameters(), responseString: StringConstant.APIResponse.login, success: { (response) in
            if let dictResponse = response.dictionaryObject as NSDictionary? {
                self.login = Login(dictionary: dictResponse)
                UserDefaults.standard.save(self.login?.data, forKey: .currentUser)
                user = UserDefaults.standard.getObject(forKey: .currentUser)
                saveBoolToDefaults(bool: true, key: .isUserLogin)
                self.pushToMainTableScreen()
            }
        }, failure: { (error) in
            print("Login API Error : \(error ?? "")")
        })
    }
}

//MARK:- Validations
extension LoginVC {
    func isValidate() -> Bool {
        if textFieldEmail.text?.isBlank() ?? true {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Validations.enterEmail)
           return false
        } else if !isValidEmail(textFieldEmail.text ?? "") {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Validations.notValidEmail)
            return false
        } else if textFieldPassword.text?.isBlank() ?? true {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Validations.enterPwd)
            return false
        }
        return true
    }
}

//MARK:- TextField Delegate Methods
extension LoginVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.changeResponder(textFields: [textFieldEmail, textFieldPassword])
        return true
    }
}
