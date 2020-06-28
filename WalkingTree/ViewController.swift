//  ViewController.swift
//  WalkingTree
//
//  Created by Jeffy Touth on 6/27/20.
//  Copyright © 2020 Jeffy Touth. All rights reserved.
//

import UIKit
import CoreMotion

func saveUserInfo(leavesAdded: Int, leavesSaved: Int, stepCount: Int) {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let context = appDelegate?.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: context) 
    if entity != nil{
        let newUserInfo = CoreMotion.NSManagedObject(entity: entity!, insertInto: context)
        newUserInfo.setValue(leavesAdded, forKey: "leavesAdded")
        newUserInfo.setValue(leavesSaved, forKey: "leavesSaved")
        newUserInfo.setValue(stepCount, forKey: "stepCount")

        // Now time to save the data
         do {          
            try context.save()       
        } catch {       
            print("Failed saving...")
        }
    }
    else{
        print("Entity was nil...")
    }
}
        
func saveLeaf(leaf: Leaf){
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "LeavesLocations", in: context)
    if entity != nil{
        let leafLocation = NSEntityDescription.insertNewObject(forEntityName: "LeavesLocations", insertInto: context)
        leafLocation.setValue(leaf, forKey: "leavesLocations")
        do {          
            try context.save()       
        } catch {       
            print("Failed saving...")
        }
    }
    else{
        print("Entity was nil...")
    }
}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let motionManager = CMMotionManager()
        let pedometer = CMPedometer()
        
        if CMPedometer.isStepCountingAvailable(){
            // Do step counting

        }
        else{
            // THIS PHONE DOESN'T HAVE PEDOMETER
            // Idk what to do here...this means app would fail to get data
        }
    }
}

// Shihan's Terrain, No Tresspassing!
// Leaf var names are "leaf-1", "leaf-2", "leaf-3"
class Leaf {
    var leafname:String
    var x:Int
    var y:Int
    var size:Int
    var angle:Int
    init(){
        // randomly select a type
        let type = Int.random(in: 1..<4)
        leafname = "leaf-" + String(type)
        // calculate random leaf position
        // dead-tree position: x = 26, y = 288, witdh = 342, height = 518
        size = Int.random(in: 15..<30) // width and height are the same 
        x = Int.random(in: 26..<(26+342-size))
        y = Int.random(in: 288..<(288+520*3/4))
        // rotate leaf image by a random angle
        angle = Int.random(in: 0..<359)
    }
    init(leaf: Leaf){
        leafname = leaf.leafname
        x = leaf.x
        y = leaf.y
        size = leaf.size
        angle = leaf.angle
    }
}

func addLeaf(){ 
    var leaf  = Leaf()
    let image = UIImage(named: leaf.leafname)
    let imageView = UIImageView(image: image!)
    imageView.frame = CGRect(x: leaf.x, y: leaf.y, width: leaf.size, height: leaf.size)
    imageView.transform = imageView.transform.rotated(by: .pi * CGFloat(leaf.angle/180))
    View.addSubview(imageView)
    // add to database

}

//every time the main page loads elements, all leafs should be loaded as well
func loadLeaf(){
    // read current leaves from database

}
