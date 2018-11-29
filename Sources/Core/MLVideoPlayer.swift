////MIT License
////
////Copyright (c) 2018 Michel Anderson Lüz Teixeira
////
////Permission is hereby granted, free of charge, to any person obtaining a copy
////of this software and associated documentation files (the "Software"), to deal
////in the Software without restriction, including without limitation the rights
////to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
////copies of the Software, and to permit persons to whom the Software is
////furnished to do so, subject to the following conditions:
////
////The above copyright notice and this permission notice shall be included in all
////copies or substantial portions of the Software.
////
////THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
////IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
////FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
////AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
////LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
////OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
////SOFTWARE.

import UIKit
import AVKit
import AVFoundation
/**
 class MLVideoPlayer extends NSObject to use observeValue func

 ### Usage Example: ###
 ````
 let mLVideoPlayer = MLVideoPlayer(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", width: 280, height: 200)
 self.addChild(mLVideoPlayer.viewController)
 self.view.addSubview(mLVideoPlayer.viewController.view)
 mLVideoPlayer.viewController.didMove(toParent: self)
 ````
 */
open class MLVideoPlayer: NSObject {
    ///Name of Library
    static let name = "MLVideoPlayer"
    ///Define AVPlayerViewController for MLVideoPlayer
    public let viewController = AVPlayerViewController()
    ///Indicates a UIView recieve activityIndicator to show loading time for readyForDisplay
    open var loadingDisplayView: UIView!
    /// Handle error
    open var handleError: ((_ error: String) -> Void)?
    ///Indicates AVPlayer
    open private(set) var player: AVPlayer!
    ///Indicates a UIActivityIndicatorView
    private let activityIndicator  = UIActivityIndicatorView(style: .white)
    ///Indicates a KVO for player
    private var observer: NSKeyValueObservation?

    /**
     Initializer MLVideoPlayer

     - Parameter url: String url for Vídeo
     - Parameter width: CGFloat for viewController.view.frame
     - Parameter height: CGFloat for viewController.view.frame
     - Parameter playInFullScreen: Bool? default true for iOS 11.0+ automatic set true to entersFullScreenWhenPlaybackBegins and exitsFullScreenWhenPlaybackEnds
     */
    convenience public init(url: String, width: CGFloat, height: CGFloat, playInFullScreen: Bool? = true) {
        self.init()
        if let dataUrl = URL(string: url) {
            player =  AVPlayer(url: dataUrl)
            viewController.player = player
            viewController.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
            loadingDisplayView = viewController.contentOverlayView
            loadingDisplayView.addSubview(activityIndicator)
            activityIndicator.frame = viewController.view.frame
            loadingDisplayView?.backgroundColor = .black
            viewController.showsPlaybackControls = false
            activityIndicator.startAnimating()
            if let fullScreen = playInFullScreen, fullScreen == true {
                if #available(iOS 11.0, *) {
                    viewController.entersFullScreenWhenPlaybackBegins = true
                    viewController.exitsFullScreenWhenPlaybackEnds = true
                }
            }
            observer = player.observe(\.status, options:  [.new, .old], changeHandler: { (playerItem, change) in
                if playerItem.status == .readyToPlay {
                    self.readyToPlay()
                    self.observer!.invalidate()
                }
            })
        } else {
            debugPrint("Check. was bad URL")
            handleError?("Check. was bad URL")
        }
    }
    /**
     This function stop activityIndicator shows Playback Controls and remove background from loadingDisplayView
     */
    private func readyToPlay() {
        viewController.showsPlaybackControls = true
        loadingDisplayView.backgroundColor = .clear
        activityIndicator.stopAnimating()
    }
}
