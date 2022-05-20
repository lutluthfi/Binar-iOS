//
//  THYoutubeData.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 4/8/22.
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
