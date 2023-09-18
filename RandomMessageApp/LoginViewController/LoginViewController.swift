//
//  ViewController.swift
//  RandomMessageApp
//
//  Created by ㅣ on 2023/09/17.
//

import UIKit
import RiveRuntime
import SwiftUI
import SnapKit
import LocalAuthentication



//MARK: - Properties
class LoginViewController: UIViewController {
    let simpleVM = RiveViewModel(fileName: "login")
    let context = LAContext()
    var error: NSError? = nil
    let reason = "Please authenticate yourself to proceed."

    private lazy var riveView: RiveView = {
        let view = RiveView()
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "MainLabel"
        label.textAlignment = .center
        label.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.layer.borderWidth = 3
        label.layer.cornerRadius = 20
        return label
    }()
    
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var background: UIImageView = {
        let background = UIImageView()
        return background
    }()
    
    
}

//MARK: - Button Action

extension LoginViewController{
    
    
    @objc func loginButtonTapped() {
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            print("Device does not support Face ID / Touch ID.")
            return
        }
        
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
            
            DispatchQueue.main.async {
                guard success else {
                    print("Authentication failed.")
                    return
                }
                
                print("Authentication was successful.")
                let mainVC = MainViewController()
                mainVC.modalPresentationStyle = .fullScreen
                mainVC.modalTransitionStyle = .crossDissolve
                self?.present(mainVC, animated: true)
                
                
             }
        }
    }
}
   

//MARK: - View Cycle

extension LoginViewController {
    
    override func viewDidLoad() {

        super.viewDidLoad()
        let riveView = simpleVM.createRiveView()
        view.addSubview(riveView)
        let width: CGFloat = 1000
        let height: CGFloat = 1000
        let x: CGFloat = (view.bounds.width - width) / 2
        let y: CGFloat = (view.bounds.height - height) / 2
        riveView.frame = CGRect(x: x, y: y, width: width, height: height)
        setupUI()
    }
}


//MARK: - Setup UI
extension LoginViewController {
    func setupUI() {
        view.addSubview(loginButton)
        view.addSubview(label)
        setupConstraints()
    }
    
    
    //MARK: - Constraints
    
    func setupConstraints() {
        
        label.snp.makeConstraints { make in
              make.centerX.equalToSuperview()
              make.top.equalToSuperview().offset(100)
            make.height.equalTo(50)
            make.width.equalTo(200)

             
          }
            
        loginButton.snp.makeConstraints { make in
              make.centerX.equalToSuperview()
              make.bottom.equalToSuperview().offset(-100)
              make.height.equalTo(50)
              make.width.equalTo(200)
          }
        
    }
}


//MARK: - Preview
struct VCPreView:PreviewProvider {
    static var previews: some View {
        LoginViewController().toPreview().edgesIgnoringSafeArea(.all)
    }
}
