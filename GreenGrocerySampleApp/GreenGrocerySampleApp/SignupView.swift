//
//  ContentView.swift
//  GreenGrocerySampleApp
//
//  Created by Talha Asif on 11/05/2024.
//

import SwiftUI

struct SignupView: View {
    
    @ObservedObject var model:SignupViewModel
    
    var body: some View {
        ZStack {
            Color.green
            VStack {
                Text("Green Grocery")
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .font(.custom("Noteworthy-Bold", size: 50.0))
                    .padding()
                AuthTextField(textField: $model.name, title: "Name", errorMessage: model.nameError, keyboardType: .default)
                AuthTextField(textField: $model.email, title: "Email", errorMessage: model.emailError, keyboardType: .emailAddress)
                AuthTextField(textField: $model.password, title: "Password", errorMessage: model.passwordError, keyboardType: .default,isSecureText: true)
                AuthTextField(textField: $model.confirmPassword, title: model.confirmPasswordError, errorMessage: model.confirmPasswordError, keyboardType: .default,isSecureText: true)
            }
        }
    }
}

#Preview {
    SignupView(model: SignupViewModel())
}

struct AuthTextField:View {
    
    @Binding var textField:String
    var title:String
    var errorMessage:String
    var keyboardType:UIKeyboardType
    var isSecureText:Bool = false
    
    var body: some View {
        VStack {
            if isSecureText {
                SecureField(title, text: $textField)
                    .keyboardType(keyboardType)
                    .textFieldStyle(.roundedBorder)
                    Text(errorMessage)
                    .foregroundStyle(ColorCodes.error.color())
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
            }
            else {
                TextField(title, text: $textField)
                    .keyboardType(keyboardType)
                    .textFieldStyle(.roundedBorder)
                Text(errorMessage)
                    .foregroundStyle(ColorCodes.error.color())
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
            }
        }
        .padding([.leading,.trailing],50)
    }
}


extension ColorCodes {
    func color() -> Color {
        switch self {
        case .primary:
            return Color.green
        case .secondary:
            return Color.white
        case .error:
            return Color.red
        }
    }
}
