//
//  FirestoreCloud.swift
//  ChomboGBFinal
//
//  Created by Ованес Захарян on 03.02.2023.
//

import Firebase
import FirebaseFirestoreSwift

final class CloudFirestore {
    
    // MARK: - Construction
    
    init() {
        fetchData()
    }
    
    // MARK: - Properties
    
    var docRef: DocumentReference!  //  ссылка на документ
    var tools: [Tools] = [] // будет содержать все инструменты с БД
    
    // MARK: - Private properties
    
    private let path = "Tools"  // название коллекции в БД
    
    
    
    // MARK: - Functions
    
    func dataToSave(_ brand: String, _ model: String, _ serial: String) {
        
        let dataToSave: [String: Any] = [
            "brand": brand,
            "model": model,
            "serial": serial
        ]
        
        docRef = Firestore.firestore().collection(path).addDocument(data: dataToSave) { error in
            if error != nil {
                print("Возникла ошибка при добавлении инструмента в базу")
            } else {
                print("Данные успешно сохранены")
            }
        }
    }
    
    
    func fetchData() {
        Firestore.firestore().collection(path).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            self.tools = snapshot?.documents.compactMap {
                try? $0.data(as: Tools.self)
            } ?? []
        }
    }
    
    
    
}




struct Tools: Codable {
    var brand: String = ""
    var model: String = ""
    var serial: String = ""
}
