//
//  FirebaseStorage.swift
//  ChomboGBFinal
//
//  Created by Ованес Захарян on 24.02.2023.
//

import FirebaseStorage
import UIKit

final class FirebaseStorage {
    
    // MARK: - Functions
    
    // Метод загрузки фотографии в облако. toolID подставляется id из модели Tool для того чтобы потом можно было получить данное фото
    
    func loadImage(inputImage: UIImage, toolID name: UUID) {
        
//        let randomID = UUID.init().uuidString
        let uploadRef = Storage.storage().reference(withPath: "toolsImage/\(name).jpg")
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
    
    func fetchImage(toolID name: UUID) -> UIImage {
        let storageRef = Storage.storage().reference(withPath: "toolsImage/\(name).jpg")
        var testImage: UIImage?
        storageRef.getData(maxSize: 4 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("Ошибка при получении данных: \(error.localizedDescription)")
                return
            }
            if let data = data {
                testImage = UIImage(data: data)!
            }
        }
        if let image = testImage {
            return image
        } else {
            return UIImage()
        }
    }
    
    func fetchURLImage(toolID name: UUID) {
        let storageRef = Storage.storage().reference(withPath: "toolsImage/\(name).jpg")
        
        storageRef.downloadURL { (url, error) in
            if let error = error {
                print("Ошибка при получении URL адреса: \(error.localizedDescription)")
            } else {
                print(url ?? "")
            }
        }
    }
    
}
