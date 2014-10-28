//
//  ViewController.swift
//  TalkingKeyboard
//
//  Created by yue.dai on 14-10-12.
//  Copyright (c) 2014年 MeowGoo Group. All rights reserved.
//

import UIKit

class ConsonantViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var consonantCollectionView: UICollectionView!
    
    var vowelViewController:VowelViewController!
    
    let reuseIdentifier = "consonant"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        vowelViewController = mainStoryboard.instantiateViewControllerWithIdentifier("vowelViewController") as VowelViewController;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let label = UILabel()
        label.text = "Hello!";
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as ConsonantCollectionViewCell
        cell.viewController = self
        
        cell.setPinyinPartOrder(indexPath.item)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func gotoVowel(consonant:String) {
        vowelViewController.consonant = consonant;
        self.presentViewController(vowelViewController, animated: false, completion: nil)
    }

}

