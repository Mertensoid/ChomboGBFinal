//
//  ViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 17.01.2023.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class ViewController: UIViewController {

    var docRef: DocumentReference!  // ссылка на документ

    var nameTextField = UITextField()
    var categoryTextField = UITextField()
    var markTextField = UITextField()
    var modelTextField = UITextField()
    var serialNumberTextField = UITextField()
    var dateOfManufactureTextField = UITextField()
    var statusTextField = UITextField()
    var currentOwnerTextField = UITextField()
    var dateOfReceiptTextField = UITextField()
    var conditionTextField = UITextField()
    var saveButton = UIButton()


    func addComponents() {
        nameTextField = UITextField(frame: CGRect(x: 25, y: 100, width: 350, height: 25))
        nameTextField.placeholder = "Наименование"
        nameTextField.backgroundColor = .systemGray
        
        self.view.addSubview(nameTextField)
        
        categoryTextField = UITextField(frame: CGRect(x: 25, y: 130, width: 350, height: 25))
        categoryTextField.placeholder = "Категория"
        categoryTextField.backgroundColor = .systemGray
        self.view.addSubview(categoryTextField)
        
        markTextField = UITextField(frame: CGRect(x: 25, y: 160, width: 350, height: 25))
        markTextField.placeholder = "Марка"
        markTextField.backgroundColor = .systemGray
        self.view.addSubview(markTextField)
        
        modelTextField = UITextField(frame: CGRect(x: 25, y: 190, width: 350, height: 25))
        modelTextField.placeholder = "Модель"
        modelTextField.backgroundColor = .systemGray
        self.view.addSubview(modelTextField)
        
        serialNumberTextField = UITextField(frame: CGRect(x: 25, y: 220, width: 350, height: 25))
        serialNumberTextField.placeholder = "Серийный номер"
        serialNumberTextField.backgroundColor = .systemGray
        self.view.addSubview(serialNumberTextField)
        
        dateOfManufactureTextField = UITextField(frame: CGRect(x: 25, y: 250, width: 350, height: 25))
        dateOfManufactureTextField.placeholder = "Дата изготовления"
        dateOfManufactureTextField.backgroundColor = .systemGray
        self.view.addSubview(dateOfManufactureTextField)
        
        statusTextField = UITextField(frame: CGRect(x: 25, y: 280, width: 350, height: 25))
        statusTextField.placeholder = "Статус"
        statusTextField.backgroundColor = .systemGray
        self.view.addSubview(statusTextField)
        
        currentOwnerTextField = UITextField(frame: CGRect(x: 25, y: 310, width: 350, height: 25))
        currentOwnerTextField.placeholder = "Текущий владелец"
        currentOwnerTextField.backgroundColor = .systemGray
        self.view.addSubview(currentOwnerTextField)
        
        dateOfReceiptTextField = UITextField(frame: CGRect(x: 25, y: 340, width: 350, height: 25))
        dateOfReceiptTextField.placeholder = "Дата получения"
        dateOfReceiptTextField.backgroundColor = .systemGray
        self.view.addSubview(dateOfReceiptTextField)
        
        conditionTextField = UITextField(frame: CGRect(x: 25, y: 370, width: 350, height: 25))
        conditionTextField.placeholder = "Техническое состояние"
        conditionTextField.backgroundColor = .systemGray
        self.view.addSubview(conditionTextField)
     

        saveButton = UIButton(frame: CGRect(x: 25, y: 500, width: 275, height: 50))
        saveButton.layer.cornerRadius = 50
        saveButton.layer.borderWidth = 3
        saveButton.layer.borderColor = UIColor.white.cgColor
        saveButton.backgroundColor = .systemGray
        saveButton.setTitle("Сохранить данные", for: .normal)
        saveButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        self.view.addSubview(saveButton)
    }




    @objc func pressButton(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let category = categoryTextField.text, !name.isEmpty else { return }
        guard let mark = markTextField.text, !name.isEmpty else { return }
        guard let model = modelTextField.text, !name.isEmpty else { return }
        guard let serialNumber = serialNumberTextField.text, !name.isEmpty else { return }
        guard let dateOfManufacture = dateOfManufactureTextField.text, !name.isEmpty else { return }
        guard let status = statusTextField.text, !name.isEmpty else { return }
        guard let currentOwner = currentOwnerTextField.text, !name.isEmpty else { return }
        guard let dateOfReceipt = dateOfReceiptTextField.text, !name.isEmpty else { return }
        guard let condition = conditionTextField.text, !name.isEmpty else { return }

        let dataToSave: [String: Any] = [
            "name": name,
            "category": category,
            "mark": mark,
            "model": model,
            "serialNumber": serialNumber,
            "dateOfManufacture": dateOfManufacture,
            "status": status,
            "currentOwner": currentOwner,
            "dateOfReceipt": dateOfReceipt,
            "condition": condition
        ]
        
       
        

        // Метод загрузки данных
//        docRef.setData(dataToSave) { error in
//            if let error = error {
//                print("возникла ошибка \(error.localizedDescription)")
//            } else {
//                print("Данные успешно сохранены!")
//            }
//        }
        docRef = Firestore.firestore().collection("Tools").addDocument(data: dataToSave) { error in
            if error != nil {
                print("возникла ошибка \(error!.localizedDescription)")
            } else {
                print("Данные успешно сохранены!")
            }
        }
        
        
        nameTextField.text = ""
        categoryTextField.text = ""
        markTextField.text = ""
        modelTextField.text = ""
        serialNumberTextField.text = ""
        dateOfManufactureTextField.text = ""
        statusTextField.text = ""
        currentOwnerTextField.text = ""
        dateOfReceiptTextField.text = ""
        conditionTextField.text = ""
        
    }












    override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        
        // Создаем коллекцию Tools в которой будут документы (все инструменты) с названием инструмента
       // docRef = Firestore.firestore().document("Tools/tool")
     //   docRef = Firestore.firestore().collection("Tools").document()

    }
}












