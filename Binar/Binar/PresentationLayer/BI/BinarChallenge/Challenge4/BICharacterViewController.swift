//
//  BICharacterViewController.swift
//  Binar
//
//  Created by Bagas Ilham on 22/05/22.
//

import UIKit
import Kingfisher

class BICharacterViewController: UITableViewController {
    
    var characterArray: [BIGameCharacter] = []
    var selectedCharacter: BIGameCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.separatorStyle = .none
        navigationController?.isNavigationBarHidden = false
        title = "GTA V Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let background = UIView()
        let characterImage = UIImageView()
        let characterNameLabel = UILabel()

        cell.contentView.addSubview(background)
        cell.contentView.addSubview(characterImage)
        cell.contentView.addSubview(characterNameLabel)
        
        switch (characterArray[indexPath.row]).characterColor {
            
        case .orange:
            background.backgroundColor = .systemOrange
            
        case .blue:
            background.backgroundColor = .systemBlue
            
        case .green:
            background.backgroundColor = .systemGreen
            
        case .last:
            background.backgroundColor = .systemPink
            
        default:
            background.backgroundColor = .systemGray
        }
        
        background.translatesAutoresizingMaskIntoConstraints = false
        background.layer.cornerRadius = 20
        
        characterImage.contentMode = .scaleAspectFit
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.clipsToBounds = true

        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        characterNameLabel.textColor = .white
        characterNameLabel.numberOfLines = 2

        
        let row = indexPath.row
        let characterName: String = characterArray[row].fullName
        characterImage.kf.setImage(with: URL(string: characterArray[row].imageURLString))
        characterImage.kf.indicatorType = .activity
        characterNameLabel.text = characterName
        
        NSLayoutConstraint.activate([
            cell.contentView.heightAnchor.constraint(equalToConstant: 170),
            
            background.widthAnchor.constraint(equalTo: (cell.contentView.layoutMarginsGuide.widthAnchor)),
            background.heightAnchor.constraint(equalToConstant: 140),
            background.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
//            background.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            background.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            
            characterImage.leftAnchor.constraint(equalTo: background.leftAnchor, constant: 20),
//            characterImage.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            characterImage.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 165),
            characterImage.widthAnchor.constraint(equalToConstant: 100),
            
            characterNameLabel.leftAnchor.constraint(equalTo: characterImage.rightAnchor, constant: 20),
            characterNameLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor)
        ])
        
        if row == 4 || row == 5 {
            characterImage.heightAnchor.constraint(equalToConstant: 153).isActive = true
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        selectedCharacter = characterArray[row]
        
        let viewController = BICharacterDetailViewController()
        viewController.detailedCharacter = selectedCharacter
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension BICharacterViewController {
    
    func createGameCharacter(firstName: String, lastName: String, description: String, specialAbility: BISpecialAbility, imageURLString: String, characterColor: BICharacterColor) {
        let character = BIGameCharacter(firstName: firstName, lastName: lastName, description: description, specialAbility: specialAbility, imageURLString: imageURLString, characterColor: characterColor)
        characterArray.append(character)
    }
    
}
extension BICharacterViewController {
    
    override func loadView() {
        super.loadView()

        createGameCharacter(firstName: "Michael",
                            lastName: "Townley",
                            description:
                                """
Michael De Santa, formerly Michael Townley, is one of the three protagonists in Grand Theft Auto V, along with Franklin Clinton and Trevor Philips. He is voiced by Ned Luke. \n\nMichael is a former bank robber and career criminal, who faked his death to retire and live a peaceful life with his family in Los Santos. However, he suffers from his unhealthy relationship with them, and soon gets pulled back into his criminal life, forcing him to return to his old ways. Michael's story centers around how his seemingly idyllic and halcyon lifestyle is brought to a halt as his past demons and morally compromising mistakes come back to haunt him. \n\nMeanwhile, his midlife crisis pushes him to his ultimate snapping point, and he becomes determined to achieve something more with his life, while also attempting to escape his past, become a free man and start a new life with his family. Michael is an old friend of fellow protagonist Trevor, and, early on in the storyline, he also befriends Franklin and becomes a mentor figure to him. He is the husband of Amanda, and the father of Jimmy and Tracey.
""",
                            specialAbility: .shooting,
                            imageURLString: "https://pngroyale.com/wp-content/uploads/2021/11/Gta-5-character-png.png",
                            characterColor: .blue)
        
        createGameCharacter(firstName: "Franklin",
                            lastName: "Clinton",
                            description:
"""
Franklin Clinton is a character in the Grand Theft Auto series who appears as one of the three protagonists in Grand Theft Auto V, along with Michael De Santa and Trevor Philips, and appears as a main character in Grand Theft Auto Online as part of The Contract update, also appearing as one of the two playable characters of the Short Trips mission series and the Double Down Adversary Modes, along with Lamar Davis. \n\nFranklin was born and lived his entire life in Los Santos. He became a gangbanger at a young age and joined The Families alongside his best friend Lamar Davis, committing various small crimes for a living. Franklin's story revolves around his desire to become something more and make something of himself, which he succeeds when he meets Michael, who becomes a mentor figure to him and recruits him in all of his robberies and various jobs for other criminals, leading to Franklin's eventual success and wealth. Franklin also befriends the third protagonist, Trevor, who, although not as close to him as Michael, still becomes somewhat of a mentor for him. \n\nHe was also briefly mentioned in Grand Theft Auto Online by Lamar Davis in the missions "Mall or Nothing" and "Community Outreach" and by Hao recalling "Shift Work" during the LS Car Meet introduction. He is later introduced as a successful entrepreneur and multi-millionaire by 2021, who owns the F. Clinton and Partner agency with his new partner, the GTA Online Protagonist. \n\nHe is voiced by Shawn Fonteno, who is the cousin of Young Maylay, the voice actor of Carl Johnson, the protagonist of Grand Theft Auto: San Andreas.
""",
                            specialAbility: .driving,
                            imageURLString: "https://pngroyale.com/wp-content/uploads/2021/11/gta-5-png-transparent.png",
                            characterColor: .green)
        
        createGameCharacter(firstName: "Trevor",
                            lastName: "Philips",
                            description:
"""
Trevor Philips is a character in the Grand Theft Auto series, appearing as one of the three protagonists of Grand Theft Auto V, along with Michael De Santa and Franklin Clinton, and appears as a main character in Grand Theft Auto Online. He is voiced by Steven Ogg.\n\nTrevor is a career criminal and former bank robber with a complicated past, who later founded his own company, Trevor Philips Enterprises, operating with drug dealing and weapon smuggling in Blaine County. He is friends with Ron Jakowski and Wade Hebert, who work for his company, as well as the oldest and best friend of Michael, whom he believed to be dead for almost a decade after he faked his death to retire from the criminal life. \n\nTrevor is known to have a generally reckless and very aggressive behavior, but he is also very loyal and deeply respects all those close to him. Trevor's story focuses on how his actions have consequences on both himself and his friends, and him coming to terms with Michael's past actions. Trevor later also befriends the third protagonist, Franklin, becoming somewhat of a mentor figure to him.
""",
                            specialAbility: .rage,
                            imageURLString: "https://pngroyale.com/wp-content/uploads/2021/11/gta-5-stars-png.png",
                            characterColor: .orange)
        
        createGameCharacter(firstName: "Lester",
                            lastName: "Crest",
                            description:
"""
                            Lester Crest is a character in the Grand Theft Auto series who appears as a central character and the main deuteragonist in Grand Theft Auto V, and as a main character in Grand Theft Auto Online.\n\nLester suffers from a wasting disease which has gradually worn down his motor skills during his life and left him wheelchair-bound, though he is able to walk short distances with the use of a cane. Due to his limited mobility, Lester has grown considerably overweight, and he also suffers from asthma. It is implied that Lester was bullied in high school, as he posted on Bleeter that "getting revenge" on his old high school class "never seemed to get old". \n\nSome time after he finished his studies, Lester applied for a faculty position at the University of San Andreas, Los Santos, but was not accepted. As an act of revenge, he hacked their systems. \n\nAt an unknown point in time, Lester met and became affiliated with bank robbers Michael Townley and Trevor Philips, becoming a regular member of their heist crews since the start of their partnership, working mostly as a planner and information scout. In 2004, Lester refused to participate in robbing a cash storage facility in Ludendorff, North Yankton, believing it was a bad idea. His suspicions are later confirmed when he discovers that, during this same heist, Michael faked his death and moved to Los Santos, having previously made a deal with Federal Investigation Bureau agent Dave Norton, but as Michael never mentioned him as part of the crew, he kept quiet about Michael's secret. After this, Michael, Trevor, and Lester lost contact with each other, though Lester secretly kept tabs on Michael and Trevor's whereabouts. \n\nAt some point, Lester moved to Los Santos as well, and purchased a garment factory in La Mesa, along with several other properties to use as fronts for his various operations.
                            """,
                            specialAbility: .none,
                            imageURLString: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/36c7442c-aed5-4e9a-86ec-0a59dd4c5a37/debied2-c9919256-96fa-47b5-97eb-5ea36904daf9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM2Yzc0NDJjLWFlZDUtNGU5YS04NmVjLTBhNTlkZDRjNWEzN1wvZGViaWVkMi1jOTkxOTI1Ni05NmZhLTQ3YjUtOTdlYi01ZWEzNjkwNGRhZjkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.IGkOLPjb7dvAyqU6z7b_ClHN8WkUuAB066_lmnv5A2M",
                            characterColor: .none)
        
        createGameCharacter(firstName: "David",
                            lastName: "Norton",
                            description:
"""
David "Dave" Norton is a character in the Grand Theft Auto series, appearing as a central character and deuteragonist to Michael De Santa in Grand Theft Auto V. \n\nNorton is a corrupt FIB agent, working under Steve Haines. \n\nLittle is known about Dave's background, other than he began working for the Federal Investigation Bureau at an unknown point in time. At another unknown point in time, Dave married an unnamed woman, though they have since divorced. According to Lester Crest, Dave's career with the FIB had been "unremarkable" until 2004, when he discovered the whereabouts of bank robber Michael Townley in Ludendorff, North Yankton. Dave made a deal with Michael to surrender his accomplice Trevor Philips to the FIB, whilst Michael would fake his death after being "shot" by Dave, in turn boosting Dave's career for taking down the "most wanted man in America".
""",
                            specialAbility: .none,
                            imageURLString: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/36c7442c-aed5-4e9a-86ec-0a59dd4c5a37/debieem-6daf5d85-a769-4d4c-ab4e-4d8fbfc8eda4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM2Yzc0NDJjLWFlZDUtNGU5YS04NmVjLTBhNTlkZDRjNWEzN1wvZGViaWVlbS02ZGFmNWQ4NS1hNzY5LTRkNGMtYWI0ZS00ZDhmYmZjOGVkYTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.qci3pSO7Jb5sLPOvJOZx9cjhses9MdwaJ1EXoDqf57c",
                            characterColor: .none)
        
        createGameCharacter(firstName: "Tonya",
                            lastName: "Wiggins",
                            description:
                                """
Tonya Wiggins is a character in the Grand Theft Auto series, appearing as a Stranger/Freak in Grand Theft Auto V, and being briefly mentioned in Grand Theft Auto Online. \n\nTonya and her boyfriend JB are old friends of Franklin Clinton. She and JB have a crack habit that causes them both to neglect their towing service business. Because of this, they are in danger of losing it to creditors. During the story, she convinces Franklin to help fill in for JB as a Tow Truck driver with her, on five separate occasions. \n\nAs mentioned by Lamar Davis inside the Record A Studios smoke room, during The Contract update for Grand Theft Auto Online, Tonya still resides in South Los Santos in 2021.
""",
                            specialAbility: .none,
                            imageURLString: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/36c7442c-aed5-4e9a-86ec-0a59dd4c5a37/debidus-5fac9a40-8015-432a-ba96-adbef7bf2f45.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM2Yzc0NDJjLWFlZDUtNGU5YS04NmVjLTBhNTlkZDRjNWEzN1wvZGViaWR1cy01ZmFjOWE0MC04MDE1LTQzMmEtYmE5Ni1hZGJlZjdiZjJmNDUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.f7gw4aoRc0mJzk32a_aqZ9ltzRpG8Ycu-VALynLFqPQ",
                            characterColor: .none)
        
        createGameCharacter(firstName: "Blow Kiss Girl",
                            lastName: " ",
                            description: "Just an ordinary girl appears on loading screen. Nothing special, unless I blow kiss every time.",
                            specialAbility: .none,
                            imageURLString: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/36c7442c-aed5-4e9a-86ec-0a59dd4c5a37/debidtv-d1fff85f-26c2-427e-9e19-a33dcdfba5ca.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM2Yzc0NDJjLWFlZDUtNGU5YS04NmVjLTBhNTlkZDRjNWEzN1wvZGViaWR0di1kMWZmZjg1Zi0yNmMyLTQyN2UtOWUxOS1hMzNkY2RmYmE1Y2EucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.7dTpW13lP9wqNOflHGNGjn4vZIAbzXGurgsZsC9nCSk",
                            characterColor: .last)
    }
}
