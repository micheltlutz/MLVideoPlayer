## [1.0.1 - Swift 5.0](https://github.com/micheltlutz/MLVideoPlayer/releases/tag/v1.0.1) (2019-04-14)

#### Add

* Support to Swift 5

-----

## [1.0.0 - Swift 4.2](https://github.com/micheltlutz/MLVideoPlayer/releases/tag/v1.0.0) (2018-11-29)

#### Add
* initial project.

## Usage
Example: ViewController > viewDidLoad

 ````swift 
 let mLVideoPlayer = MLVideoPlayer(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", width: 280, height: 200)
 self.addChild(mLVideoPlayer.viewController)
 self.view.addSubview(mLVideoPlayer.viewController.view)
 mLVideoPlayer.viewController.didMove(toParent: self)
 ````
