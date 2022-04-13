//
//  UIImageView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 23/03/22.
//

import UIKit

extension UIImageView {
    func loadImage(resource: URL?) {
        preparationLoadImage()
        guard let resource = resource else { return }
        DispatchQueue.global(qos: .background).async {
            guard let data = try? Data(contentsOf: resource) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
    
    func loadImage(resource: String?) {
        preparationLoadImage()
        guard let resource = resource, let url = URL(string: resource) else { return }
        loadImage(resource: url)
    }
    
    private func preparationLoadImage() {
        image = UIImage(systemName: "photo.fill")
    }
}
