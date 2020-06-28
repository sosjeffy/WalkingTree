//  ViewController.swift
//  WalkingTree
//
//  Created by Jeffy Touth on 6/27/20.
//  Copyright © 2020 Jeffy Touth. All rights reserved.
//

import UIKit
import CoreMotion
import CoreData

func saveUserInfo(leavesAdded: Int, leavesSaved: Int, stepCount: Int) {
    print("SAVE USER INFO RUNNING")
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: context) 
    if entity != nil{
        let newUserInfo = CoreData.NSManagedObject(entity: entity!, insertInto: context)
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
    print("SAVE LEAF RUNNING")
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "LeavesLocations", in: context)
    if entity != nil{
        
        let leafLocation = CoreData.NSManagedObject(entity: entity!, insertInto: context)
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
        var stepCount = 0
        var leavesAdded = 0
        var leavesSaved = 0
        var leavesLocation = [Leaf]()
        var dataExisted = false
        //Now check CoreData and bring in all values as needed. If data existed, change dataExisted=true via dataExist.toggle()

        // Do work on data as applicable.


        if CMPedometer.isStepCountingAvailable(){
            // Do step counting


            //Step Counting is done. Make sure to add +1 to leavesSaved every time steps taken is mod 10 = 0. 
            

            if dataExisted{
                // Update data entries
            }
            else{
                // Add data
                //saveUserInfo(leavesAdded:leavesAdded, leavesSaved:leavesSaved, stepCount:stepCount)
            }
        }
        else{
            // THIS PHONE DOESN'T HAVE PEDOMETER
            // Idk what to do here...this means app would fail to get data
        }
    }
    
    @IBAction func addLeafButton(_ sender: Any) {
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
    let leaf  = Leaf()

    // add to database
    saveLeaf(leaf: leaf) // Not sure if correct 

}

    addLeafToView(leaf : leaf)//every time the main page loads elements, all leafs should be loaded as well
func loadLeaf(){
    // read current leaves from database

    let leaf  = Leaf()
    let image = UIImage(named: leaf.leafname)
    let imageView = UIImageView(image: image!)
    imageView.frame = CGRect(x: leaf.x, y: leaf.y, width: leaf.size, height: leaf.size)
    imageView.transform = imageView.transform.rotated(by: .pi * CGFloat(leaf.angle/180))
        // read current leaves from database
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "LeavesLocations")
    //request.predicate = NSPredicate(format: "age = %@", "12")
    request.returnsObjectsAsFaults = false
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            addLeafToView(leaf : data)
        }
        
    } catch {
        print("Failed")
    }    let window = UIApplication.shared.keyWindow!
    window.addSubview(imageView)
    // add to database
    //saveLeaf(leaf: leaf) // Not sure if correct 

}   window.addSubview(imageView)
    // add to database
    //saveLeaf(leaf: leaf) // Not sure if correct 

}

//every time the main page loads elements, all leafs should be loaded as well
func loadLeaf2(){
    // read current leaves from database

}
