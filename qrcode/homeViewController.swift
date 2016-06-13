//
//  homeViewController.swift
//  qrcode
//
//  Created by Dealjava on 6/11/16.
//  Copyright © 2016 prototype. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    
    
    private var history : HistoryViewController!
    private var scanner : ViewController!;
    private var isShownMenu : Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        history = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
        history.view.frame = CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height - 64)
        history.view.frame.size.width -= (0.2 * self.view.bounds.width)
        history.view.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
        self.addChildViewController(history)
        self.view.addSubview(history.view)
        
        scanner = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        scanner.view.frame = self.view.bounds
        scanner.view.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
        self.addChildViewController(scanner)
        self.view.insertSubview(scanner.view, atIndex: 0)
        
        prepareUI()
    }

    func prepareUI(){
        let menubar = UIButton(type: .Custom)
        menubar.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        menubar.setImage(UIImage(named: "menu_bar"), forState: .Normal)
        menubar.addTarget(self, action: #selector(self.menubarDidTap), forControlEvents: .TouchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menubar)
    }
    
    func menubarDidTap(){
        isShownMenu = !isShownMenu
        if isShownMenu {
            history.updateData()
            UIView.animateWithDuration(0.3, animations: { 
                self.history.view.transform = CGAffineTransformIdentity
            })
            scanner.stopScan()
        }else{
            UIView.animateWithDuration(0.3, animations: {
                self.history.view.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
            })
            scanner.startScan()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
