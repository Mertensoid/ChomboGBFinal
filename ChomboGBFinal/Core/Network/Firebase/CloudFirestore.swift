//
//  FirestoreCloud.swift
//  ChomboGBFinal
//
//  Created by Ованес Захарян on 03.02.2023.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import UIKit

final class CloudFirestore {
    
    // MARK: - Construction
    
    init() {
        fetchData()
    }
    
    // MARK: - Properties
    
    var docRef: DocumentReference!  //  ссылка на документ
    var tools: [Tool] = [] // будет содержать все инструменты с БД
    
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
                try? $0.data(as: Tool.self)
            } ?? []
        }
    }
    
    func dataToSaveWithModel(_ tool: Tool) {
        do {
            _ = try Firestore.firestore().collection(path).document(tool.id.uuidString).setData(from: tool)
            print("Данные добавлены успешно")
        } catch {
            fatalError("Ошибка при добавлении данных")
        }
    }
    
    func loadImage(inputImage: UIImage) {
        
        let randomID = UUID.init().uuidString
        let uploadRef = Storage.storage().reference(withPath: "toolsImage/\(randomID).jpg")
        guard let imageData = inputImage.jpegData(compressionQuality: 0.75) else { return }
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg"
        
        uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
            if let error = error {
                print("Возникла ошибка: \(error.localizedDescription)")
                return
            }
            print("Загрузка выполнена успешно: \(String(describing: downloadMetadata))")
        }
    }
    
//    func fetchImage() {
//        let storageRef = Storage.storage().reference(withPath: "toolsImage/testPicture.jpg")
//        storageRef.getData(maxSize: 4 * 1024 * 1024) { [weak self] (data, error) in
//            if let error = error {
//                print("Ошибка при получении данных: \(error.localizedDescription)")
//                return
//            }
//            if let data = data {
//                self?.imageView.image = UIImage(data: data)
//            }
//        }
//    }
    
}




//struct Tools: Codable {
//    var brand: String = ""
//    var model: String = ""
//    var serial: String = ""
//}
