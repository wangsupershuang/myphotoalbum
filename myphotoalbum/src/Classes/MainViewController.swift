//
//  ViewController.swift
//  myphotoalbum
//
//  Created by wwll on 16/5/13.
//  Copyright © 2016年 wangshuang. All rights reserved.
//

import UIKit
import CocoaLumberjack
import iCarousel

class MainViewController: BaseViewController,iCarouselDelegate,iCarouselDataSource {

    var items: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view!.backgroundColor=UIColor.redColor()
//        DDLogVerbose("Verbose");
//        DDLogDebug("Debug");
//        DDLogInfo("Info");
//        DDLogWarn("Warn");
//        DDLogError("Error");
        
        for i in 0...99
        {
            items.append(i)
        }
//
        let carousel:iCarousel=iCarousel(frame: UIScreen.mainScreen().bounds);
        
//        self.carousel = [[iCarousel alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        [self.view addSubview:self.carousel];
//        self.carousel.delegate = self;
//        self.carousel.dataSource = self;
//        self.carousel.type = iCarouselTypeCustom;
//        self.carousel.bounceDistance = 0.2f;
//        self.carousel.viewpointOffset = CGSizeMake(-cardWidth/5.0f, 0);
        carousel.type = .CoverFlow2
        carousel.delegate=self;
        carousel.dataSource=self;
        self.view.addSubview(carousel)
        
//        let btn1:UIButton!=UIButton(type: UIButtonType.Custom)
//        btn1.backgroundColor=UIColor.blackColor()
//        btn1.frame=CGRect(x: 0,y: 0,width: 50,height: 50)
//        self.view.addSubview(btn1)
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int
    {
        return items.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView
    {
        var label: UILabel
        var itemView: UIImageView
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:200, height:200))
            itemView.image = UIImage(named: "page.png")
            itemView.contentMode = .Center
            
            label = UILabel(frame:itemView.bounds)
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = label.font.fontWithSize(50)
            label.tag = 1
            itemView.addSubview(label)
        }
        else
        {
            //get a reference to the label in the recycled view
            itemView = view as! UIImageView;
            label = itemView.viewWithTag(1) as! UILabel!
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(items[index])"
        
        return itemView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            return value * 1.1
        }
        return value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

