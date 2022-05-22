//
//  BIAnimalViewController.swift
//  Binar
//
//  Created by Bagas Ilham on 22/05/22.
//

import UIKit
import Kingfisher

@available(iOS 14.0, *)
final class BIAnimalViewController: UITableViewController {
    
    var displayedAnimal: [Animal] = Animal.listV2()
    var isAnimalLiked: [String : Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animal List"
        let optionButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: nil
        )
        optionButton.menu = UIMenu(
            title: "More options",
            options: .displayInline,
            children: optionButtonElements()
        )
        
        navigationItem.rightBarButtonItem = optionButton
        
        tableView.register(BIAnimalCell.self, forCellReuseIdentifier: "\(BIAnimalCell.self)")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        setupIsLikedArray()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(isAnimalLiked, forKey: "bi-animal-liked-dict")
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return displayedAnimal.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let row = indexPath.row
        let animal = displayedAnimal[row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BIAnimalCell.self)", for: indexPath) as? BIAnimalCell else { return UITableViewCell() }
        cell.fill(with: displayedAnimal[row], isLiked: isAnimalLiked[animal.name]!)
        cell.isLiked = isAnimalLiked[animal.name]!
        
        cell.onLikeTap = {
            self.isAnimalLiked[animal.name]!.toggle()
        }
        
        return cell
    }
    
    func setupIsLikedArray() {
        
        let likedArray: [String : Bool] = UserDefaults.standard.object(forKey: "bi-animal-liked-dict") as? [String : Bool] ?? [:]
        
        if !likedArray.isEmpty {
            
            isAnimalLiked = likedArray
            
        } else {
            
            for num in 1...displayedAnimal.count {
                let displayedAnimal = displayedAnimal
                isAnimalLiked[displayedAnimal[num - 1].name] = false
            }
            
        }
    
    }
    
    func sortByNameAscending() {
       displayedAnimal.sort(by: ( { $0.name < $1.name } ))
        self.tableView.reloadData()
    }
    
    func sortByNameDescending() {
       displayedAnimal.sort(by: ( { $0.name > $1.name } ))
        self.tableView.reloadData()
    }
    
    func optionButtonElements() -> [UIMenuElement] {
        
        var menus: [UIMenuElement] = []
        
        let sortByNameAsc = UIAction(
            title: "Sort by name ascending",
            image: UIImage(systemName: "arrow.uturn.up.square"),
            identifier: nil
        ) { _ in
            self.sortByNameAscending()
        }
        
        let sortByNameDesc = UIAction(
            title: "Sort by name descending",
            image: UIImage(systemName: "arrow.uturn.down.square"),
            identifier: nil
        ) { _ in
            self.sortByNameDescending()
        }
        
        menus.append(sortByNameAsc)
        menus.append(sortByNameDesc)
        
        return menus
    }
}

final class BIAnimalCell: UITableViewCell {
    
    let animalImageView = UIImageView()
    let animalNameLabel = UILabel()
    let animalfoodLabel = UILabel()
    let likeButton = UIImageView()
    var isLiked: Bool?
    
    typealias OnLikeTapped = () -> Void
    var onLikeTap: OnLikeTapped?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defineCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        animalImageView.image = nil
        animalNameLabel.text = nil
        animalfoodLabel.text = nil
        likeButton.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        likeButton.tintColor = .label
    }
    
    func defineCellLayout() {
        
        contentView.addSubview(animalImageView)
        contentView.addSubview(animalNameLabel)
        contentView.addSubview(animalfoodLabel)
        contentView.addSubview(likeButton)
        
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        animalImageView.clipsToBounds = true
        animalImageView.contentMode = .scaleAspectFit
        
        animalNameLabel.translatesAutoresizingMaskIntoConstraints = false
        animalNameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        animalNameLabel.numberOfLines = 1
        animalNameLabel.textColor = .label
        
        animalfoodLabel.translatesAutoresizingMaskIntoConstraints = false
        animalfoodLabel.font = .systemFont(ofSize: 12, weight: .regular)
        animalfoodLabel.numberOfLines = 1
        animalfoodLabel.textColor = .secondaryLabel
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onLikeButtonTap))
        likeButton.addGestureRecognizer(tap)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.clipsToBounds = true
        likeButton.isUserInteractionEnabled = true
        likeButton.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        likeButton.tintColor = .label
        likeButton.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            
            animalImageView.widthAnchor.constraint(equalToConstant: 100),
            animalImageView.heightAnchor.constraint(equalToConstant: 100),
            animalImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            animalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            animalImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            animalNameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 15),
            animalNameLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -40),
            animalNameLabel.centerYAnchor.constraint(equalTo: animalImageView.centerYAnchor, constant: -10),
            
            animalfoodLabel.leadingAnchor.constraint(equalTo: animalNameLabel.leadingAnchor),
            animalfoodLabel.centerYAnchor.constraint(equalTo: animalImageView.centerYAnchor, constant: 10),
            
            likeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: UITableView.automaticDimension)
            
        ])
        
    }
    
    func fill(with animal: Animal, isLiked: Bool) {
        
        animalImageView.kf.setImage(with: URL(string: animal.photoUrlString))
        
        animalNameLabel.text = animal.name
        
        animalfoodLabel.text = animal.typeOfFood.rawValue
        
        if isLiked {
            likeButton.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
            likeButton.tintColor = .systemRed
        } else {
            likeButton.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
            likeButton.tintColor = .label
        }
        
    }
    
    @objc func onLikeButtonTap() {
        onLikeTap?()
        isLiked?.toggle()
        
        if isLiked! {
            likeButton.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
            likeButton.tintColor = .systemRed
        } else {
            likeButton.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
            likeButton.tintColor = .label
        }
    }
    
}
