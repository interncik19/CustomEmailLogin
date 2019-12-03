//
//  ViewController.swift
//  CustomEmailLogin
//
//  Created by Trinidad Garcia on 18/05/18.
//  Copyright © 2018 Trinidad Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool =  true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn
        if isSignIn{
            signInLabel.text = "Sing in"
            signInButton.setTitle("Sign In", for: .normal)
        } else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
        
            if isSignIn{
               //Sigin with firebase
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    // to do something with this vars
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        print(error ?? "error")
                    }
                }
            } else {
                //Register with firebase
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    // Register user and pass
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        
                    }
                }
            }
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
}









