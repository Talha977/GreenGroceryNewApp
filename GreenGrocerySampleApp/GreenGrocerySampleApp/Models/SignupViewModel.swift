//
//  SignupViewModel.swift
//  GreenGrocerySampleApp
//
//  Created by Talha Asif on 11/05/2024.
//

import SwiftUI
import Combine

class SignupViewModel:ObservableObject {
    
    private var cancellableBag = Set<AnyCancellable>()
    @Published var name:String = ""
    var nameError:String = ""
    @Published var email:String = ""
    var emailError:String = ""
    @Published var password:String = ""
    var passwordError:String = ""
    @Published var confirmPassword:String = ""
    var confirmPasswordError:String = ""
    
    // MARK: - Publishers
    private var usernamePublisher:AnyPublisher<Bool,Never> {
        return $name
            .map{ !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var validEmailPublisher:AnyPublisher<Bool,Never> {
        return $email
            .map{ !$0.isEmpty && $0.isValidEmail() }
            .eraseToAnyPublisher()
    }
    
    private var validPasswordPublisher:AnyPublisher<Bool,Never> {
        return $password
            .map { !$0.isEmpty && $0.isValidPassword()
            }
            .eraseToAnyPublisher()
    }s
    
    private var passwordEqualPublisher:AnyPublisher<Bool,Never> {
        Publishers.CombineLatest($password, $confirmPassword)
            .map { pass,confirmPass in
                return pass == confirmPass
        }
           .eraseToAnyPublisher()
    }
    
    init() {
        usernamePublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0 ? "" : "Username is missing"}
            .assign(to: \.nameError, on: self)
            .store(in: &cancellableBag)
        
        validEmailPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0 ? "" : "Email is not valid"}
            .assign(to: \.emailError, on: self)
            .store(in: &cancellableBag)
        
        validPasswordPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0 ? "" : "Password is not valid"}
            .assign(to: \.passwordError, on: self)
            .store(in: &cancellableBag)
        
        passwordEqualPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0 ? "" : "Password and confirm Password does not match"}
            .assign(to: \.confirmPasswordError, on: self)
            .store(in: &cancellableBag)

    }
}
