//
//  UIViewController+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 01/04/22.
//

import UIKit

extension UIViewController {
    func enableHideKeyboardGesture() {
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(onHideKeyboardTapGesture)
        )
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func onHideKeyboardTapGesture() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func enableKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(_keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func _keyboardWillShow(_ notification: Notification) {
        let keyboardInfoKey = UIResponder.keyboardFrameEndUserInfoKey
        guard let keyboardValue = notification.userInfo?[keyboardInfoKey] as? NSValue else {
            return
        }
        
        let keyboardFrame: CGRect = keyboardValue.cgRectValue
        keyboardWillShow(notification, keyboardFrame: keyboardFrame)
    }
    
    @objc func keyboardWillShow(_ notification: Notification, keyboardFrame: CGRect) {
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
    }
}

extension UIViewController {
    final func dequeueCell<CellType>(
        _ cellType: CellType.Type,
        in collectionView: UICollectionView,
        at indexPath: IndexPath,
        completion: @escaping (CellType) -> Void
    ) -> UICollectionViewCell where CellType: UICollectionViewCell {
        let reusableCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(cellType)",
            for: indexPath
        )
        
        if let cell = reusableCell as? CellType {
            completion(cell)
        }
        
        return reusableCell
    }
    
    final func dequeueCell<CellType>(
        _ cellType: CellType.Type,
        in tableView: UITableView,
        at indexPath: IndexPath,
        completion: @escaping (CellType) -> Void
    ) -> UITableViewCell where CellType: UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(
            withIdentifier: "\(cellType)",
            for: indexPath
        )
        
        if let cell = reusableCell as? CellType {
            completion(cell)
        }
        
        return reusableCell
    }
}
