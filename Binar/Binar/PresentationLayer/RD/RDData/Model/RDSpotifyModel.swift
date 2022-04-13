//
//  RDSpotifyModel.swift
//  Binar
//
//  Created by Raden Dimas on 13/04/22.
//

import UIKit

struct RDSpotifyModel: Codable {
    let title: String
    let titleDescription: String
    let imageCover: String
    let playlist: String
    let follower: Int
    
    
    init(title: String,titleDescription: String,imageCover: String,playlist: String,follower: Int) {
        self.title = title
        self.titleDescription = titleDescription
        self.imageCover = imageCover
        self.playlist = playlist
        self.follower = follower
    }
    
}

extension RDSpotifyModel {
    
    static func dummySpotifyData() -> [RDSpotifyModel] {
        let dummyData = """
                [
                    {
                        "name": "Chital",
                        "titleDescription": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
                        "imageCover": "https://robohash.org/consectetursapientedeserunt.png?size=700x700&set=set1",
                        "playlist": "herbivora",
                        "follower": 214
                    },
                    {
                        "name": "Chital",
                        "titleDescription": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
                        "imageCover": "https://robohash.org/consectetursapientedeserunt.png?size=700x700&set=set1",
                        "playlist": "herbivora",
                        "follower": 214
                    },
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

