//
//  MFQRVC.swift
//  Binar
//
//  Created by Maulana Frasha on 03/04/22.
//

import AVFoundation
import UIKit

final class MFQRVC: UIViewController{
    
    @IBOutlet var camView: UIView!
    
    var captureSession: AVCaptureSession!
    var backCamera: AVCaptureDevice!
    var backInput: AVCaptureInput!
    var previewLayer : AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Scan QR Code"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupAndStartCaptureSession()
    }
    
    func setupAndStartCaptureSession(){
            DispatchQueue.global(qos: .userInitiated).async{
                //init session
                self.captureSession = AVCaptureSession()
                //start configuration
                self.captureSession.beginConfiguration()
                
                //session specific configuration
                if self.captureSession.canSetSessionPreset(.photo) {
                    self.captureSession.sessionPreset = .photo
                }
                self.captureSession.automaticallyConfiguresCaptureDeviceForWideColor = true
                
                //setup inputs
                self.setupInputs()
                
                DispatchQueue.main.async {
                    //setup preview layer
                    self.setupPreviewLayer()
                }
                
                //commit configuration
                self.captureSession.commitConfiguration()
                //start running it
                self.captureSession.startRunning()
            }
        }
    
    func setupInputs(){
            //get back camera
            if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
                backCamera = device
            } else {
                //handle this appropriately for production purposes
                fatalError("no back camera")
            }
            
            //now we need to create an input objects from our devices
            guard let bInput = try? AVCaptureDeviceInput(device: backCamera) else {
                fatalError("could not create input device from back camera")
            }
            backInput = bInput
            if !captureSession.canAddInput(backInput) {
                fatalError("could not add back camera input to capture session")
            }
            
            //connect back camera input to session
            captureSession.addInput(backInput)
        }
    
    func setupPreviewLayer(){
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            view.layer.insertSublayer(previewLayer, at: 0)
        previewLayer.frame = self.view.layer.frame
        previewLayer.videoGravity = .resizeAspectFill
    }
    
}
