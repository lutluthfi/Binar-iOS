//
//  IGAvatar.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/15/22.
//

import UIKit

final class IGAvatar: UIView {
  typealias OnTap = () -> Void
  
  enum Size {
    case small
    case medium
    case large
  }
  
  lazy var image: UIImageView = {
    let image = UIImageView()
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageViewTapped))
    return image
  }()
  
  var onTap: OnTap?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(image)
    self.frame = image.frame
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func IGAvatar(size: Size, urlString: String) {
    switch size {
    case .small:
      setupConstraint(wConstant: 32, hConstant: 32)
      image.layer.cornerRadius = 32 / 2
      self.clipsToBounds = true
    case .medium:
      setupConstraint(wConstant: 40, hConstant: 40)
      image.layer.cornerRadius = 40 / 2
      self.clipsToBounds = true
    case .large:
      setupConstraint(wConstant: 64, hConstant: 64)
      image.layer.cornerRadius = 64 / 2
      self.clipsToBounds = true
    }
    setupImage(urlString: urlString)
  }
  
  // convert urlString to ImageView
  private func setupImage(urlString: String) {
    guard let url = URL(string: urlString) else { return }
    guard let imageData = try? Data(contentsOf: url) else { return }
    image.image = UIImage(data: imageData)
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
  }
  
  @objc private func onImageViewTapped(_ gesture: UITapGestureRecognizer) {
    onTap?()
    print("Tapped")
  }
  
  private func setupConstraint(wConstant: CGFloat, hConstant: CGFloat) {
    image.translatesAutoresizingMaskIntoConstraints = false
    image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    image.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    image.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    image.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    image.widthAnchor.constraint(equalToConstant: wConstant).isActive = true
    image.heightAnchor.constraint(equalToConstant: hConstant).isActive = true
  }
}
