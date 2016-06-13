//
//  HistoryViewController.swift
//  qrcode
//
//  Created by Dealjava on 6/11/16.
//  Copyright © 2016 prototype. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,SESlideTableViewCellDelegate{

    @IBOutlet weak var tableview : UITableView!;
    private var data : UILabel!;
    private var time : UILabel!;
    private var source : [[String:AnyObject]]?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        source = NSUserDefaults.standardUserDefaults().valueForKey("history") as? [[String:AnyObject]]
        source = source?.reverse()
        tableview.rowHeight = 60;
    }
    
    func updateData() {
        source = NSUserDefaults.standardUserDefaults().valueForKey("history") as? [[String:AnyObject]]
        source = source?.reverse()
        tableview.reloadData()
        print(source)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if source == nil {
            return 0
        }
        return source!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier("cell") as! SESlideTableViewCell;
        cell.delegate = self
        cell.removeAllRightButtons()
        
        data = cell.viewWithTag(1) as! UILabel
        time = cell.viewWithTag(2) as! UILabel
        
        
        let dateformat = NSDateFormatter()
        dateformat.dateFormat = "dd MMMM yyyy | HH:mm"
        
        data.text = source![indexPath.row]["data"] as? String
        time.text = dateformat.stringFromDate(NSDate(timeIntervalSince1970: source![indexPath.row]["time"] as! Double))
        time.font = UIFont.systemFontOfSize(12);
        
        cell.addButtonWithText("Copy", textColor: UIColor.whiteColor(), backgroundColor: UIColor.grayColor(),font: UIFont.systemFontOfSize(15), side: SESlideTableViewCellSide.Right)
        cell.addButtonWithText("Browser", textColor: UIColor.whiteColor(), backgroundColor: UIColor.grayColor(),font: UIFont.systemFontOfSize(15), side: SESlideTableViewCellSide.Right)
        cell.addButtonWithText("DEL", textColor: UIColor.whiteColor(), backgroundColor: UIColor.redColor(),font: UIFont.systemFontOfSize(15), side: SESlideTableViewCellSide.Left)
        return cell;
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! SESlideTableViewCell).removeAllRightButtons()
        (cell as! SESlideTableViewCell).removeAllLeftButtons()
        (cell as! SESlideTableViewCell).delegate = nil
    }
    
    func slideTableViewCell(cell: SESlideTableViewCell!, didTriggerLeftButton buttonIndex: Int) {
        let indexPath = tableview.indexPathForCell(cell)
        if buttonIndex == 0 { //delete
            source?.removeAtIndex(indexPath!.row)
        }
        cell.setSlideState(SESlideTableViewCellSlideState.Center, animated: true)
        NSUserDefaults.standardUserDefaults().setValue(source!.reverse(), forKey: "history")
        tableview.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
    }
    
    func slideTableViewCell(cell: SESlideTableViewCell!, didTriggerRightButton buttonIndex: Int) {
        let indexPath = tableview.indexPathForCell(cell)
        if buttonIndex == 0 { //copy
            let paste = UIPasteboard.generalPasteboard()
            paste.string = source![indexPath!.row]["data"] as? String
        }else if buttonIndex == 1 {//open in safari
            UIApplication.sharedApplication().openURL(NSURL(string: source![indexPath!.row]["data"] as! String)!)
        }
        cell.setSlideState(SESlideTableViewCellSlideState.Center, animated: true)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    @IBAction func clearAll(){
        NSUserDefaults.standardUserDefaults().removeObjectForKey("history")
        updateData()
        tableview.reloadData()
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
