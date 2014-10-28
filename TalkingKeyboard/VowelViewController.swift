//
//  VowelViewController.swift
//  TalkingKeyboard
//
//  Created by yue.dai on 14-10-25.
//  Copyright (c) 2014年 MeowGoo Group. All rights reserved.
//

import UIKit
import AudioToolbox
import QuartzCore
import AVFoundation

class VowelViewController: UIViewController {
    @IBOutlet weak var vowelCollectionView: UICollectionView!
    
    var consonant: String!
    
    var player: AVAudioPlayer!
    
    let reuseIdentifier = "vowel"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        vowelCollectionView.registerClass(VowelCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 35
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as VowelCollectionViewCell
        
        cell.viewController = self
        cell.setPinyinPartOrder(indexPath.item)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    func read(#filename: String, type: String) {
        let path = NSBundle.mainBundle().pathForResource(filename, ofType: type)
        if path == nil {
            return
        }
        let url = NSURL.fileURLWithPath(path!)
        
        var error : NSError? = NSError()
        player = AVAudioPlayer(contentsOfURL: url, error: &error)
        if error != nil {
            println(error)
            return
        }
        player.play()
    }
    
    func readAndGotoConsonant(#vowel: String, tone: String) {
        let pinyin = consonant + vowel + tone
        read(filename: pinyin, type: "mp3")
        self.dismissViewControllerAnimated(false, completion: nil)
    }

}
