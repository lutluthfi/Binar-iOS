//
//  MFFasilChallenge3.swift
//  Binar
//
//  Created by Maulana Frasha on 01/04/22.
//

import UIKit

final class MFFasilChallenge3VC: UIViewController{
    
    @IBOutlet weak var topLeftButtonOutlet: UIButton!
    @IBOutlet weak var topRightButtonOutlet: UIButton!
    @IBOutlet weak var qrCodeScanView: UIView!
    @IBOutlet weak var scanQRImageOutlet: UIImageView!
    @IBOutlet weak var qrHandImage: UIImageView!
    
    @IBOutlet weak var covid19vaccineOutlet: UIImageView!
    @IBOutlet weak var covid19VaccineLabel: UILabel!
    
    @IBOutlet weak var covid19testOutlet: UIImageView!
    @IBOutlet weak var covid19TestLabel: UILabel!
    
    @IBOutlet weak var ehacOutlet: UIImageView!
    @IBOutlet weak var ehacLabel: UILabel!
    
    @IBOutlet weak var travelOutlet: UIImageView!
    @IBOutlet weak var travelLabel: UILabel!
    
    @IBOutlet weak var telemedic: UIImageView!
    @IBOutlet weak var telemedicLabel: UILabel!
    
    @IBOutlet weak var healthcare: UIImageView!
    @IBOutlet weak var healthcareLabel: UILabel!
    
    
    @IBOutlet weak var covid19stat: UIImageView!
    @IBOutlet weak var covid19StatLabel: UILabel!
    
    @IBOutlet weak var findhospital: UIImageView!
    @IBOutlet weak var findHospitalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PeduliLindungi UI"
        
        let leftButtonSize = UIImage.SymbolConfiguration(
            pointSize: 32, weight: .regular, scale: .default)
        let leftButtonImage = UIImage(systemName: "person.crop.circle", withConfiguration: leftButtonSize)
        topLeftButtonOutlet.setImage(leftButtonImage, for: .normal)
        
        let rightButtonSize = UIImage.SymbolConfiguration(
            pointSize: 25, weight: .regular, scale: .default)
        let rightButtonImage = UIImage(systemName: "bell", withConfiguration: rightButtonSize)
        topRightButtonOutlet.setImage(rightButtonImage, for: .normal)
        
        qrCodeScanView.backgroundColor = UIColor(red: 0.14, green: 0.61, blue: 0.85, alpha: 1.00)
        qrCodeScanView.layer.cornerRadius = 25
        
        scanQRImageOutlet.loadImage(resource: "https://i.ibb.co/BGT3hq3/scanqrcodeicon.png")
        qrHandImage.loadImage(resource: "https://i.ibb.co/ykvbRKV/handqr.png")
        
        covid19vaccineOutlet.loadImage(resource: "https://i.ibb.co/CvbywfK/covid19vacine.jpg")
        covid19VaccineLabel.text = "COVID-19\nVaccine"
        
        covid19testOutlet.loadImage(resource: "https://i.ibb.co/xDc0RtY/covid19test.png")
        covid19TestLabel.text = "Covid-19\nTest Results"
        
        ehacOutlet.loadImage(resource: "https://i.ibb.co/DgBrj6M/ehac.png")
        ehacLabel.text = "EHAC"
        
        travelOutlet.loadImage(resource: "https://i.ibb.co/mSwGM3j/travelregulations.png")
        travelLabel.text = "Travel\nRegulations"
        
        telemedic.loadImage(resource: "https://i.ibb.co/XjtgLsz/telemedic.png")
        telemedicLabel.text = "Telemedicine"
        
        healthcare.loadImage(resource: "https://i.ibb.co/0GyZ8Lr/healthcare.png")
        healthcareLabel.text = "Healthcare\nFacility"
        
        covid19stat.loadImage(resource: "https://i.ibb.co/hBZwHYz/covide19statistic.png")
        covid19StatLabel.text = "Covid-19\nStatistic"
        
        findhospital.loadImage(resource: "https://i.ibb.co/hKNh3Xq/findhospitalbed.png")
        findHospitalLabel.text = "Find Hospital\nBed"
        
    }
    
    @IBAction func scanQRButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MFMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MFQRVC") as? MFQRVC else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

