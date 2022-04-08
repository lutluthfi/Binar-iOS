//
//  THYoutubeHomeViewController.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 4/5/22.
//

import UIKit




struct VideoElement: Codable {
    let picture: String
    let profile: String
    let duration: String
    let title: String
    let channelName: String
    let viewers: String
    let uploadDate: String
    let percentPlaytime: Int
}

typealias Video = [VideoElement]

func getVideo() -> Video {
    let data =
    """
    [
      {
        "picture": "https://picsum.photos/1280/720",
        "profile": "https://picsum.photos/40/40",
        "duration": "36:37",
        "title": "in irure et ipsum elit velit ipsum dolor mollit magna",
        "channelName": "Herrera Swanson",
        "viewers": "260,987",
        "uploadDate": "August 16, 2018",
        "percentPlaytime" : 42
      },
      {
        "picture": "https://picsum.photos/1280/720",
        "profile": "https://picsum.photos/40/40",
        "duration": "67:82",
        "title": "fugiat consequat adipisicing ad commodo aute dolore pariatur cillum incididunt",
        "channelName": "Estrada Mann",
        "viewers": "444,669",
        "uploadDate": "June 15, 2018",
        "percentPlaytime" : 69
      },
      {
        "picture": "https://picsum.photos/1280/720",
        "profile": "https://picsum.photos/40/40",
        "duration": "72:52",
        "title": "aute magna veniam excepteur cillum laborum dolore amet qui magna",
        "channelName": "Pratt Rutledge",
        "viewers": "248,878",
        "uploadDate": "September 05, 2017",
        "percentPlaytime" : 74
      },
      {
        "picture": "https://picsum.photos/1280/720",
        "profile": "https://picsum.photos/40/40",
        "duration": "72:97",
        "title": "duis pariatur labore anim aute Lorem est sunt cupidatat aute",
        "channelName": "Key Bray",
        "viewers": "966,784",
        "uploadDate": "January 28, 2018",
        "percentPlaytime" : 34
      },
      {
        "picture": "https://picsum.photos/1280/720",
        "profile": "https://picsum.photos/40/40",
        "duration": "79:40",
        "title": "ullamco aliquip sit ullamco laborum occaecat sit veniam ullamco mollit",
        "channelName": "Lesa Carey",
        "viewers": "479,627",
        "uploadDate": "June 29, 2021",
        "percentPlaytime" : 71
      },
      {
        "picture": "https://picsum.photos/1280/720",
        "profile": "https://picsum.photos/40/40",
        "duration": "60:96",
        "title": "Lorem ullamco velit amet Lorem velit culpa non dolore duis",
        "channelName": "Doreen Manning",
        "viewers": "814,227",
        "uploadDate": "June 07, 2016",
        "percentPlaytime" : 52
      }
    ]
    """
    do {
        let jsonData = Data(data.utf8)
        let video = try JSONDecoder().decode(Video.self, from: jsonData)
        print(video)
        return video
    } catch {
        print(String(describing: error))
        return []
    }

}

final class THYoutubeHomeViewController: UITableViewController {
    var video = getVideo()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.registerCell(VideoCell.self)
       
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return video.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "VideoCell", for: indexPath ) as! VideoCell
        cell.fill(video[indexPath.row])
        
        return cell
    }
}

class VideoCell : UITableViewCell {
 
func fill(_ video: VideoElement) {
    videoImage.loadImage(resource: video.picture)
    durationLabel.text = video.duration
    profileImage.loadImage(resource: video.profile)
    titleLabel.text = video.title
    detailLabel.text = "\(video.channelName) • \(video.viewers) views • \(video.uploadDate)"
    playedLineView.frame.size.width = CGFloat( 375/100 * video.percentPlaytime)
                
}
 
private lazy var videoImage : UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    imgView.frame.size.height = 210
    return imgView
}()
    
private lazy var durationLabel : UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.backgroundColor = .black
    lbl.textAlignment = .center
    lbl.font = UIFont.boldSystemFont(ofSize: 10)
    lbl.numberOfLines = 1
    return lbl
}()

private lazy var lineView: UIView = {
    let vw = UIView()
    vw.backgroundColor = .gray
    vw.frame.size.width = 375
    vw.frame.size.height = 2
    vw.frame.origin.y = videoImage.frame.size.height - vw.frame.size.height
    return vw
}()
private lazy var playedLineView: UIView = {
    let vw = UIView()
    vw.backgroundColor = .red
    vw.frame.size.width = 0
    vw.frame.size.height = 2
    vw.frame.origin.y = videoImage.frame.size.height - vw.frame.size.height
    return vw
}()
    
private lazy var profileImage : UIImageView = {
    let imgView = UIImageView()
    imgView.layer.masksToBounds = false
    imgView.layer.borderColor = UIColor.black.cgColor
    imgView.layer.cornerRadius = 20
    imgView.clipsToBounds = true
    return imgView
}()
    
 private lazy var titleLabel : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 16)
     lbl.textAlignment = .left
     lbl.numberOfLines = 1
     return lbl
 }()
 
 
 private lazy var detailLabel : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .gray
     lbl.font = UIFont.systemFont(ofSize: 16)
     lbl.textAlignment = .left
     return lbl
 }()
 
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(videoImage)
    addSubview(profileImage)
    addSubview(titleLabel)
    addSubview(detailLabel)
    
    videoImage.makeConstraint {
        [$0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         $0.heightAnchor.constraint(equalToConstant: self.videoImage.frame.size.height),
         $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)]
    }
    profileImage.makeConstraint {
        [$0.topAnchor.constraint(equalTo: self.videoImage.bottomAnchor, constant: 10),
         $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         $0.heightAnchor.constraint(equalToConstant: 40),
         $0.widthAnchor.constraint(equalToConstant: 40)]
    }
    titleLabel.makeConstraint {
        [$0.topAnchor.constraint(equalTo: self.videoImage.bottomAnchor, constant: 10),
         $0.leadingAnchor.constraint(equalTo: self.profileImage.trailingAnchor, constant: 10),
         $0.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20)]
    }
    detailLabel.makeConstraint {
        [$0.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
         $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
         $0.leadingAnchor.constraint(equalTo: self.profileImage.trailingAnchor, constant: 10),
         $0.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20)]
    }
     
    videoImage.addSubview(durationLabel)
    videoImage.addSubview(lineView)
    videoImage.addSubview(playedLineView)
    
    durationLabel.makeConstraint {
        [$0.bottomAnchor.constraint(equalTo: self.videoImage.bottomAnchor, constant: -10),
         $0.trailingAnchor.constraint(lessThanOrEqualTo: self.videoImage.trailingAnchor, constant: -10),
         $0.widthAnchor.constraint(equalToConstant: 40)]
    }
       
 }
 
 required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
 }
 
 
}
