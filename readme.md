# What is WalkingTree? 
Have you ever wanted to reduce your own carbon footprint? Or desired an app that encourages walking? Well, WalkingTree is just for you! Amply and uncreatively named, WalkingTree is an iOS application that would allow a user (that's you) to earn "leaves" that can then be added onto an initially bare tree. In order to gain leaves, the user would have to walk a certain amount of steps (our idea was 10,000). 

Other possible features would include the ability for the user to select leaf placement on the tree and selecting what type of leaf they would like to add.

# Implementation

In terms of working code, WalkingTree can only add a random leaf to a random location surrounding the tree. Each leaf element is stored persistently using CoreData.* Constraints were also added to main application images in order to allow for greater device capability. 

There is also some code to assist with the implementation of storing and reading user data (such as how many leaves the user has stored up and still need to add, how many steps has the user taken in the lifetime of using the application, and the number of leaves that the user has gained overall) and the usage of CoreMotion for recording user steps, however, we were not able to finish this in the time allotted for the hackathon. 

*It is important to note that while programmatically each leaf is stored, we have not implemented checking this storage at app start-up in order to load up previously added leaves. In other words, leaves are stored and saved, but not reloaded back into the app view.

# Video
https://www.youtube.com/watch?v=0GKJDFMWZk0

# Credits
Project created with love by Jefferson Touth and Shihan Tang.

Tree image and leaf icons were created and free to use by [Pixel perfect](https://www.flaticon.com/authors/pixel-perfect) and [Freepik](https://www.flaticon.com/authors/freepik) at [www.flaticon.com](www.flaticon.com) 
