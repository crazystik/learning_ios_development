//
//  ViewController.swift
//  lesson1App
//
//  Created by Pavel Lazarev on 04.09.2021.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var loginTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    private func addObservers() {
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(self.keyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
        
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(self.keyboardWillHide),
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
    }
    
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
        
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
        
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView?.contentInset = .zero
    }
    
    private func addGesture() {
        self.scrollView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard)
            )
        )
    }
    
    @objc private func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    @IBAction private func enterButtonAction() {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "account" && password == "123456" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }

    }
}

