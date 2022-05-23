//
//  NewsSharer.swift
//  programmatically
//
//  Created by Bagas on 05/04/22.
//

import UIKit

struct BINewsSharer {
    static func share(in viewController: UIViewController, newsHeadline: String, newsImageUrlString: String) {
        let text: String = newsHeadline
        let image = UIImageView()
        image.loadImage(resource: newsImageUrlString)
        let link = URL(string: "akcdn.detik.net.id/community/media/visual/2022/03/29/cristiano-ronaldo-2_169.jpeg?w=700&q=90")
        let activityViewController = UIActivityViewController(activityItems: [link ?? "", text, image], applicationActivities: nil)
    
    viewController.present(activityViewController, animated: true, completion: nil)
  }
  
}
