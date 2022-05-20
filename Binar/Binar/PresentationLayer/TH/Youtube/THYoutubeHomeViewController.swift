//
//  THYoutubeHomeViewController.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 4/5/22.
//

import UIKit


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
         lbl.font = UIFont.systemFont(ofSize: 12)
         lbl.textAlignment = .left
         return lbl
     }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(videoImage)
        addSubview(profileImage)
        addSubview(titleLabel)
        addSubview(detailLabel)
        videoImage.addSubview(durationLabel)
        videoImage.addSubview(lineView)
        videoImage.addSubview(playedLineView)

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
