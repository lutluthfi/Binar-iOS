//
//  ARVideoViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 30/05/22.
//

import AVKit
import UIKit

final class ARVideoViewController: UIViewController {
    private(set) var playerLayer: AVPlayerLayer?
    
    private(set) var player: AVPlayer?
    private(set) var playerItem: AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        guard let url = URL(string: "https://r6---sn-uxa3vhnxa-jb3e7.googlevideo.com/videoplayback?expire=1653910362&ei=-laUYrHXEdOe1gLbw4TgBQ&ip=212.40.116.143&id=o-AMBHJVMrM-TkVNZyGll8RoAsas_oTpJWmwNFNZmyL1jT&itag=18&source=youtube&requiressl=yes&spc=4ocVC3adMdHZxRc3QkIbjXHRORGm&vprv=1&mime=video%2Fmp4&ns=mxM1GMHMT2C04xZBI5wgCZ8G&gir=yes&clen=84136305&ratebypass=yes&dur=1634.452&lmt=1652787783331730&fexp=24001373%2C24007246&c=WEB&txp=5538434&n=r9ldjjqc401joXW36OVC&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgf6Ggvmxrf5vC2lcmM-P04pIHvuY0SSx-2mSx3vtXiicCIQCbC7CBmIeEP3gn0ZA0vQZMTyJqG6cRifFnB2Se8wBDOg%3D%3D&title=KEJEBUR+JURANG%E2%80%A6.+MAAFKAN+AKU...&cms_redirect=yes&mh=it&mip=114.124.206.38&mm=31&mn=sn-uxa3vhnxa-jb3e7&ms=au&mt=1653888312&mv=m&mvi=6&pcm2cms=yes&pl=23&lsparams=mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AG3C_xAwRgIhAK1sQnOHM7lSXbmRwZfb_5YtGZAF_u8EfU91FxbuvjVzAiEAi0dBQf_eJYk0AdWVB2zUP64hUCgefbBJ7Axt_-_fcaI%3D") else { return }
        setupAsset(with: url) { [weak self] (asset) in
            guard let _self = self else { return }
            _self.setupPlayerItem(with: asset)
        }
    }
    
    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        if keyPath == #keyPath(AVPlayerItem.status) {
            print(">>> observeValue playerItem status")
            
            let status: AVPlayerItem.Status
            if let statusNumber = change?[.newKey] as? NSNumber {
                status = AVPlayerItem.Status(rawValue: statusNumber.intValue)!
            } else {
                status = .unknown
            }
            
            switch status {
            case .readyToPlay:
                print(">>> readyToPlay")
                print(">>> videoRect: \(playerLayer?.videoRect)")
                
//                player?.play()
            case .failed:
                print(">>> failed")
            case .unknown:
                print(">>> unknown")
            @unknown default:
                print(">>> default")
            }
        }
    }
    
    func setupAsset(with url: URL, completion: @escaping (AVAsset) -> Void) {
        let asset = AVAsset(url: url)
        asset.loadValuesAsynchronously(forKeys: ["playable"]) {
            var error: NSError? = nil
            let status = asset.statusOfValue(forKey: "playable", error: &error)
            switch status {
            case .loaded:
                print(">>> loaded")
                completion(asset)
            case .failed:
                print(">>> failed")
            case .cancelled:
                print(">>> cancelled")
            default:
                print(">>> default")
            }
        }
    }
    
    private func setupPlayerItem(with asset: AVAsset) {
        playerItem = AVPlayerItem(asset: asset)
        playerItem?.addObserver(
            self,
            forKeyPath: #keyPath(AVPlayerItem.status),
            options: [.old, .new],
            context: nil
        )
        guard let _playerItem = playerItem else { return }
        
        DispatchQueue.main.async { [self] in
            let playerViewController = AVPlayerViewController()
            playerViewController.player = AVPlayer(playerItem: _playerItem)
            navigationController?.pushViewController(playerViewController, animated: true)
        }
    }
}
