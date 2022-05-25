//
//  THLoveAnimal.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 5/20/22.
//


import UIKit

final class THLoveAnimal: UITableViewController{
    var animalList: [Animal] = Animal.listV2()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Animal"
        tableView.register(animalCell.self, forCellReuseIdentifier: "animalCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "animalCell", for: indexPath) as! animalCell
        let animal: Animal = animalList[indexPath.row]
        cell.fill(with: animal)
        return cell
    }
    
    
}

final class animalCell : UITableViewCell {
    let userDefaults = UserDefaults.standard
    
    
    func fill(with animal: Animal){
        animalImage.loadImage(resource:animal.photoUrlString.components(separatedBy: "?")[0])
        nameLabel.text = animal.name
        checkLove()
    }
    
    
    private lazy var frameView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    

    private lazy var animalImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var loveButton: UIButton = {
        let button = UIButton()
        let Config = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let loveSymbol = UIImage(systemName: "heart", withConfiguration: Config)
        button.setImage(loveSymbol, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func buttonAction(sender: UIButton!) {
        var lovedList: [String] = []
        if let localdata = userDefaults.object(forKey: "lovedList") {
            lovedList = localdata as! [String]
        }
        let loved = lovedList.contains(nameLabel.text!)
        if(!loved){
            lovedList.append(nameLabel.text!)
            userDefaults.set(lovedList, forKey: "lovedList")
        }
        else{
            lovedList = lovedList.filter(){$0 != nameLabel.text!}
            userDefaults.set(lovedList, forKey: "lovedList")
        }
        checkLove()
    }
    
    
    func checkLove(){
        var lovedList: [String] = []
        if let localdata = userDefaults.object(forKey: "lovedList") {
            lovedList = localdata as! [String]
        }
        let Config = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        var loveSymbol = UIImage()
        
        if (lovedList.contains(nameLabel.text!)){
            loveSymbol = UIImage(systemName: "heart.fill", withConfiguration: Config)!
        }
        else{
            loveSymbol = UIImage(systemName: "heart", withConfiguration: Config)!
        }
        
        loveButton.setImage(loveSymbol, for: .normal)
    }
    


    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        backgroundColor = UIColor(red: 215/255, green: 217/255, blue: 223/255, alpha: 1)
        addSubview(frameView)
        frameView.addSubview(animalImage)
        frameView.addSubview(nameLabel)
        frameView.addSubview(loveButton)
        NSLayoutConstraint.activate([
            //framView Constraint
            frameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            frameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            frameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            frameView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            //animalImage Constraint
            animalImage.leadingAnchor.constraint(equalTo: frameView.leadingAnchor),
            animalImage.trailingAnchor.constraint(equalTo: frameView.trailingAnchor),
            animalImage.topAnchor.constraint(equalTo: frameView.topAnchor),
            animalImage.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -40),
            
            //nameLabel Constraint
            nameLabel.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: animalImage.bottomAnchor, constant: 10),
            
            //loveButton Constraint
            loveButton.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -10),
            loveButton.topAnchor.constraint(equalTo: animalImage.bottomAnchor, constant: 10),
        ])
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
}
