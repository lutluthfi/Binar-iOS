//
//  RDSpotifyModel.swift
//  Binar
//
//  Created by Raden Dimas on 13/04/22.
//

import UIKit

struct RDSpotifyModel: Codable {
    let title: String
    let subTitle: String
    let playlist: [RDSpotifyPlaylist]

}

struct RDSpotifyPlaylist: Codable {
    let title: String
    let image: String
    let follower: Int
}

extension RDSpotifyModel {
    static func dummySpotifyData() -> [RDSpotifyModel] {
        let dummyData = """
                [
                    {
                        "title": "Native American Heritage Month",
                        "subTitle": "Celebrate with a collection of music and lyrics by indigeneous artist.",
                        "playlist": [
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 1800000
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 1360500
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 18980111
                            },
                        ]
                    },
                    {
                        "title": "Get Set For The Day",
                        "subTitle": "Celebrate with a collection of music and lyrics by indigeneous artist.",
                        "playlist": [
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 19011901
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 11910190
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 30330222
                            },
                        ]
                    },
                    {
                        "title": "Chill For Your Day",
                        "subTitle": "Celebrate with a collection of music and lyrics by indigeneous artist.",
                        "playlist": [
                        {
                            "title": "Justin Bieber",
                            "image": "SpotifyCover1",
                            "follower": 404930930
                        },
                        {
                            "title": "Justin Bieber",
                            "image": "SpotifyCover1",
                            "follower": 290191091
                        },
                        {
                            "title": "Justin Bieber",
                            "image": "SpotifyCover1",
                            "follower": 291019011
                            },
                        ]
                    },
                ]
                    
        """
        do {
            let jsonData = Data(dummyData.utf8)
            let spotifyData: [RDSpotifyModel] = try JSONDecoder().decode([RDSpotifyModel].self, from: jsonData)
            return spotifyData
        } catch {
            return []
        }
    }
    
}

