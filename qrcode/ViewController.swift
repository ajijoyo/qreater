//
//  ViewController.swift
//  qrcode
//
//  Created by Dealjava on 6/6/16.
//  Copyright © 2016 prototype. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    @IBOutlet weak var readLabel : UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readLabel.layer.backgroundColor = UIColor.blackColor().CGColor
        capture()
    }
    
    func capture(){
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let input  = try? AVCaptureDeviceInput(device: captureDevice)
        captureSession = AVCaptureSession()
        captureSession?.addInput(input)
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureMetadataOutput.accessibilityFrame = CGRect(x: 64, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 60)
        captureSession?.addOutput(captureMetadataOutput)
        
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        captureSession?.startRunning()
        
        view.bringSubviewToFront(readLabel)
        
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.greenColor().CGColor
        qrCodeFrameView?.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView!)
        view.bringSubviewToFront(qrCodeFrameView!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.copytext))
        readLabel.addGestureRecognizer(tap)
        readLabel.userInteractionEnabled = true
        
        
    }
    
    func copytext(){
        if !readLabel.text!.isEmpty {
            startScan()
            let paste = UIPasteboard.generalPasteboard()
            paste.string = readLabel.text
            readLabel.layer.backgroundColor = UIColor.yellowColor().CGColor
            UIView.animateWithDuration(0.5, animations: { 
               self.readLabel.layer.backgroundColor = UIColor.blackColor().CGColor
            })
        }
    }
    
    func startScan(){
        qrCodeFrameView?.frame = CGRectZero
        captureSession?.startRunning()
    }
    
    func stopScan(){
        captureSession?.stopRunning()
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRectZero
            readLabel.text = "No QR code is detected"
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            
            let barCodeObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            qrCodeFrameView?.frame = barCodeObject.bounds;
            
            if metadataObj.stringValue != nil {
                readLabel.text = metadataObj.stringValue
                stopScan()
                if var history = NSUserDefaults.standardUserDefaults().valueForKey("history") as? [[String:AnyObject]] {
                    history.append(["data":metadataObj.stringValue,"time":NSDate().timeIntervalSince1970])
                    NSUserDefaults.standardUserDefaults().setValue(history, forKey: "history")
                    
                }else{
                    NSUserDefaults.standardUserDefaults().setValue([["data":metadataObj.stringValue,"time":NSDate().timeIntervalSince1970]], forKey: "history")
                }
                
                print(NSUserDefaults.standardUserDefaults().valueForKey("history"))
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

