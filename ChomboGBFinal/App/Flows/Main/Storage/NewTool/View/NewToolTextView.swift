//
//  NewToolTextView.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

final class NewToolTextView: UIView {
    
    // MARK: - Private properties

    private let textLabel = UILabel()
    private let textField = UITextField()
    private let underline = UIView()
    
    // MARK: - Construction
    
    init(frame: CGRect, textLabelText: String) {
        super.init(frame: frame)
        
        addViews()
        configureConstraints()
        configureViews(textLabelText: textLabelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    
    private func addViews() {
        
        addSubview(textLabel)
        addSubview(textField)
        addSubview(underline)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            underline.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            underline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            underline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            underline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func configureViews(textLabelText: String) {
        
        backgroundColor = ColorConstants.backgroundGray
        layer.cornerRadius = 10
        layer.borderColor = ColorConstants.borderGray.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = ColorConstants.baseBlack
        textLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        textLabel.numberOfLines = 1
        textLabel.minimumScaleFactor = 0.5
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.text = textLabelText
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.textColor = ColorConstants.baseBlack
        textField.borderStyle = .none
        textField.backgroundColor = .none
        
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.backgroundColor = ColorConstants.darkYellow
    }
}

//перенести в presenter
//@objc extension LoginViewController {
//
//    // Когда клавиатура появляется
//    func keyboardWasShown(notification: Notification) {
//
//        // Получаем размер клавиатуры
//        let info = notification.userInfo! as NSDictionary
//        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
//
//        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
//        self.scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//        UIView.animate(withDuration: 1) {
//            self.scrollView.constraints
//                .first(where: { $0.identifier == "keyboardShown" })?
//                .priority = .required
//            self.scrollView.constraints
//                .first(where: { $0.identifier == "keyboardHide" })?
//                .priority = .defaultHigh
//            self.view.layoutIfNeeded()
//        }
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
//    }
//
//    //Когда клавиатура исчезает
//    func keyboardWillBeHidden(notification: Notification) {
//        // Устанавливаем отступ внизу UIScrollView, равный 0
//        let contentInsets = UIEdgeInsets.zero
//        self.scrollView.contentInset = contentInsets
//        UIView.animate(withDuration: 1) {
//            self.scrollView.constraints
//                .first(where: { $0.identifier == "keyboardShown" })?
//                .priority = .defaultHigh
//            self.scrollView.constraints
//                .first(where: { $0.identifier == "keyboardHide" })?
//                .priority = .required
//            self.view.layoutIfNeeded()
//        }
//    }
//
//    func hideKeyboard() {
//        view.endEditing(true)
//    }
//
//    func joinButtonPressed() {
//
//    }
//
//    func registrationButtonPressed() {
//
//    }
//}
