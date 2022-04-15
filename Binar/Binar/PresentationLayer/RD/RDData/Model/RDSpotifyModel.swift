//
//  RDSpotifyModel.swift
//  Binar
//
//  Created by Raden Dimas on 13/04/22.
//

import UIKit

struct RDSpotifyModel: Codable {
    let title: String
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
                        "title": "Section1",
                        "playlist": [
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1"
                                "follower": 180
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 180
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1"
                                "follower": 180
                            },
                        ]
                    },
                    {
                        "title": "Section2",
                        "playlist": [
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1"
                                "follower": 180
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1",
                                "follower": 180
                            },
                            {
                                "title": "Justin Bieber",
                                "image": "SpotifyCover1"
                                "follower": 180
                            },
                        ]
                    },
                    {
                        "title": "Section3",
                        "playlist": [
                        {
                            "title": "Justin Bieber",
                            "image": "SpotifyCover1"
                            "follower": 180
                        },
                        {
                            "title": "Justin Bieber",
                            "image": "SpotifyCover1",
                            "follower": 180
                        },
                        {
                            "title": "Justin Bieber",
                            "image": "SpotifyCover1"
                            "follower": 180
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

