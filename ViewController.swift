//
//  ViewController.swift
//  See-Food
//
//  Created by Chaitanya Ramji on 9/18/17.
//  Copyright © 2017 Chaitanya Ramji. All rights reserved.
//

import UIKit
import CoreML
import LBTAComponents


class ViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    lazy var captureButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "capture_photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleCaptureButton), for: .touchUpInside)
        return button
        
    }()
    
    let output = AVCapturePhotoOutput()
    
    let model = SeeFood()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCameraSession()
        preparecaptureButton()
    }

    func preparecaptureButton()
    {
        let val = w/2 - 40
        
        view.addSubview(captureButton)
        _ = captureButton.anchorWithReturnAnchors(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 24, rightConstant: 0, widthConstant: 80, heightConstant: 80)
        captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(mediaButton)
        
        _ = mediaButton.anchorWithReturnAnchors(captureButton.topAnchor, left: view.leftAnchor, bottom: captureButton.bottomAnchor, right: captureButton.leftAnchor, topConstant: 15, leftConstant: val/2 - 25, bottomConstant: 15, rightConstant: val/2 - 25, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(scanButton)
        
        _ = scanButton.anchorWithReturnAnchors(captureButton.topAnchor, left: captureButton.rightAnchor, bottom: captureButton.bottomAnchor, right: view.rightAnchor, topConstant: 15, leftConstant: val/2 - 25, bottomConstant: 15, rightConstant: val/2 - 25, widthConstant: 0, heightConstant: 0)
        
    }
    
    fileprivate func prepareCameraSession()
    {
        let captureSession = AVCaptureSession()
        let mediaType = AVMediaTypeVideo
        let device = AVCaptureDevice.defaultDevice(withMediaType: mediaType)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: device)
            if captureSession.canAddInput(input)
            {
                captureSession.addInput(input)
            }
        }
        catch let error
        {
            print("Couldn't setup camera input: ",error)
        }
        
        if captureSession.canAddOutput(output)
        {
            captureSession.addOutput(output)
        }
        
        guard let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) else {return}
        previewLayer.frame = view.frame
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func handleCaptureButton()
    {
        let settings = AVCapturePhotoSettings()
        output.capturePhoto(with: settings, delegate: self)
        imageView.isHidden = true
    }
}

extension ViewController {
    
    func capture(_ output: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        guard let imageData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer!, previewPhotoSampleBuffer: previewPhotoSampleBuffer) else {return}
        
        let previewImage = UIImage(data: imageData)
        
        guard let input = model.preprocess(image: previewImage!) else {
            print("preprocessing failed")
            return
        }
        
        guard let result = try? model.prediction(image: input) else {
            print("prediction failed")
            return
        }
        
        let confidence = result.foodConfidence["\(result.classLabel)"]! * 100.0
        let converted = String(format: "%.2f", confidence)
        
        print("Prediciton is: \(result.classLabel) - \(converted) %")
    }
    
}



