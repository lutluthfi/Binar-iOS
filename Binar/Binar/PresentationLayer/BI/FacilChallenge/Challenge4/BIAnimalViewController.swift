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
    
    var displayedAnimal: [Animal]?
    var isAnimalLiked: [String : Bool] = [:]
    var likesCount: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        likesCount = likesCounter()
    }
    
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
        
        tableView.register(
            BIAnimalCell.self,
            forCellReuseIdentifier: "\(BIAnimalCell.self)"
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 10
        
        view.backgroundColor = .secondarySystemBackground
        
        setupDisplayedAnimals()
        setupIsLikedArray()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(isAnimalLiked, forKey: "bi-animal-liked-dict")
        let encoder = JSONEncoder()
        if let animals = try? encoder.encode(displayedAnimal) {
            UserDefaults.standard.set(animals, forKey: "bi-displayed-animal-array")
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return displayedAnimal?.count ?? 0
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let row = indexPath.row
        guard let displayedAnimal = displayedAnimal else { return UITableViewCell() }
        let animal = displayedAnimal[row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(BIAnimalCell.self)",
            for: indexPath
        ) as? BIAnimalCell else {
            return UITableViewCell()
        }
        cell.fill(
            with: displayedAnimal[row],
            isLiked: isAnimalLiked[animal.name] ?? false
        )
        cell.isLiked = isAnimalLiked[animal.name] ?? false
        cell.selectionStyle = .none
        cell.onLikeTap = { [weak self] in
            guard let _self = self else { return }
            _self.isAnimalLiked[animal.name]!.toggle()
            _self.likesCount = _self.likesCounter()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let animalCount = displayedAnimal?.count else { return nil }
        guard let likesCount = likesCount else { return nil }
        return "Animals count: \(animalCount), Likes count: \(likesCount)"
    }
    
    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let row = indexPath.row
        let item = UIContextualAction(
            style: .destructive,
            title: "Delete"
        ) { action, view, completion in
            
            let ac = UIAlertController(
                title: "Delete animal",
                message: "Are you sure want to delete this animal? You can bring this animal back by resetting the animal list.",
                preferredStyle: .alert)
            
            let delete = UIAlertAction(
                title: "Delete",
                style: .destructive
            ) { [self] _ in
                guard let displayedAnimal = displayedAnimal else { return }
                if isAnimalLiked[(displayedAnimal[row].name)] == true {
                    likesCount! -= 1
                }
                isAnimalLiked.removeValue(forKey: (displayedAnimal[row].name))
                self.displayedAnimal?.remove(at: row)
                tableView.deleteRows(
                    at: [indexPath],
                    with: .top
                )
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 1
                ) {
                    completion(true)
                    tableView.reloadData()
                }
            }
            
            let cancel = UIAlertAction(
                title: "Cancel",
                style: .cancel
            ) { _ in
                completion(true)
            }
            
            ac.addAction(cancel)
            ac.addAction(delete)
            
            self.present(ac, animated: true)
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [item])
        return swipeActions
    }
    
    func setupDisplayedAnimals() {
        let decoder = JSONDecoder()
        let data: Data = UserDefaults.standard.object(
            forKey: "bi-displayed-animal-array"
        ) as? Data ?? Data()
        let animals = try? decoder.decode([Animal].self, from: data)
        
        if !(animals?.isEmpty ?? true) {
            self.displayedAnimal = animals

        } else {
            self.displayedAnimal = Animal.listV2()
            for row in 1...displayedAnimal!.count {
                self.displayedAnimal?[row - 1].photoUrlString = "https://robohash.org/\(row)"
            }
        }
    }
    
    func setupIsLikedArray() {
        
        let likedArray: [String : Bool] = UserDefaults.standard.object(
            forKey: "bi-animal-liked-dict"
        ) as? [String : Bool] ?? [:]
        
        if !likedArray.isEmpty {
            isAnimalLiked = likedArray
        } else {
            guard let displayedAnimal = displayedAnimal else { return }
            for num in 1...displayedAnimal.count {
                let displayedAnimal = displayedAnimal
                isAnimalLiked[(displayedAnimal[num - 1].name)] = false
            }
        
        }
    
    }
    
    func sortByNameAscending() {
        displayedAnimal?.sort(by: ( { $0.name < $1.name } ))
        self.tableView.reloadData()
    }
    
    func sortByNameDescending() {
       displayedAnimal?.sort(by: ( { $0.name > $1.name } ))
        self.tableView.reloadData()
    }
    
    func resetDisplayedAnimals() {
        displayedAnimal = Animal.listV2()
        for num in 1...displayedAnimal!.count {
            let displayedAnimal = displayedAnimal
            isAnimalLiked[(displayedAnimal?[num - 1].name)!] = false
        }
        for row in 1...displayedAnimal!.count {
            self.displayedAnimal?[row - 1].photoUrlString = "https://robohash.org/\(row)"
        }
        likesCount = 0
        UserDefaults.standard.removeObject(forKey: "bi-displayed-animal-array")
        UserDefaults.standard.removeObject(forKey: "bi-animal-liked-dict")
        tableView.reloadData()
        let topIndex = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: topIndex, at: .top, animated: true)
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func optionButtonElements() -> [UIMenuElement] {
        
        var menus: [UIMenuElement] = []
        
        let sortByNameAsc = UIAction(
            title: "Sort by name ascending",
            image: UIImage(systemName: "arrow.uturn.down"),
            identifier: nil
        ) { _ in
            self.sortByNameAscending()
        }
        
        let sortByNameDesc = UIAction(
            title: "Sort by name descending",
            image: UIImage(systemName: "arrow.uturn.up"),
            identifier: nil
        ) { _ in
            self.sortByNameDescending()
        }
        
        let resetAnimals = UIAction(
            title: "Reset animal list data",
            image: UIImage(systemName: "arrow.clockwise"),
            identifier: nil,
            attributes: .destructive
        ) { _ in
            let ac = UIAlertController(
                title: "Reset Animal List",
                message: "Are you sure want to reset the animal list? All changes made will be reset.",
                preferredStyle: .alert
            )
            let cancel = UIAlertAction(
                title: "Cancel",
                style: .cancel
            )
            let reset = UIAlertAction(title: "Reset", style: .destructive) { _ in
                self.resetDisplayedAnimals()
            }
            ac.addAction(cancel)
            ac.addAction(reset)
            
            self.present(ac, animated: true)
        }
        
        menus.append(sortByNameAsc)
        menus.append(sortByNameDesc)
        menus.append(resetAnimals)
        
        return menus
    }
    
    func likesCounter() -> Int {
        var likeCount = 0
        for liked in isAnimalLiked.values {
            if liked {
                likeCount += 1
            }
        }
        likesCount = likeCount
        tableView.reloadData()
        return likeCount
    }
}

final class BIAnimalCell: UITableViewCell {
    
    let animalImageView = UIImageView()
    let animalNameLabel = UILabel()
    let animalfoodLabel = UILabel()
    let likeButton = UIImageView()
    var isLiked: Bool = false
    
    typealias OnLikeTapped = () -> Void
    var onLikeTap: OnLikeTapped?
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
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
        animalImageView.layer.cornerRadius = 8
        animalImageView.backgroundColor = .secondarySystemBackground
        
        animalNameLabel.translatesAutoresizingMaskIntoConstraints = false
        animalNameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        animalNameLabel.numberOfLines = 1
        animalNameLabel.textColor = .label
        
        animalfoodLabel.translatesAutoresizingMaskIntoConstraints = false
        animalfoodLabel.font = .systemFont(ofSize: 12, weight: .regular)
        animalfoodLabel.numberOfLines = 1
        animalfoodLabel.textColor = .secondaryLabel
        
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(onLikeButtonTap)
        )
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
            animalImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            animalImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            animalImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
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
    
    func fill(
        with animal: Animal,
        isLiked: Bool
    ) {
        animalImageView.kf.setImage(
            with: URL(string: animal.photoUrlString),
            options: [
                .cacheOriginalImage,
                .transition(.fade(0.3))
            ]
        )
        animalImageView.kf.indicatorType = .activity
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
        isLiked.toggle()
        if isLiked {
            likeButton.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
            likeButton.tintColor = .systemRed
        } else {
            likeButton.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
            likeButton.tintColor = .label
        }
    }
    
}
