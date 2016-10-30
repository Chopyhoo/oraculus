//
//  LoginScreenViewController.swift
//  oraculus
//
//  Created by Alex Sobolevski on 10/16/16.
//  Copyright © 2016 Alex Sobolevski. All rights reserved.
//

import UIKit
import VK_ios_sdk

class LoginScreenViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    
    var VKSDKInstance: VKSdk?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        VKSDKInstance = VKSdk.initialize(withAppId: "5679458")
        VKSDKInstance!.register(self)
    }
    
    @IBAction func vkLogin() {
        VKSdk.wakeUpSession([VK_API_LONG]) { (state, error) -> Void in
            switch (state) {
            case VKAuthorizationState.authorized:
                self.goToQuestions()
            case VKAuthorizationState.initialized:
                // User not yet authorized, proceed to next step
                VKSdk.authorize([VK_PER_EMAIL, VK_PER_GROUPS])
            default:
                // Probably, network error occured, try call +[VKSdk wakeUpSession:completeBlock:] later
                break
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if result.token != nil {
            // User successfully authorized, you may start working with VK API
            print("successfully authorized")
            goToQuestions()
            
        } else if (result.error != nil) {
            // User canceled authorization, or occured unresolving networking error. Reset your UI to initial state and try authorize user later
            print("authorization unsuccessfull")
        }
    }
    
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.present(controller, animated: true, completion: nil)
    }
    
    
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
    }
    
    func vkSdkUserAuthorizationFailed() {
    }
    
    @IBAction func proceedWithoutRegistration() {
        goToQuestions()
    }
    
    // MARK: - Navigation
    func goToQuestions(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "QuestionsViewController")
        self.present(destinationVC, animated: true)
    }
    //MARK: - For my current task it is enough, later it will be modified for each login way(with using "prepare for segue")
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    //}
    
    
}
