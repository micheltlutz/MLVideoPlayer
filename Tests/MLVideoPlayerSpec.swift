//
//  MLVideoPlayerSpec.swift
//  MLVideoPlayer
//
//  Created by Michel Lutz on 04/10/16.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import Quick
import Nimble
@testable import MLVideoPlayer

class MLVideoPlayerSpec: QuickSpec {

    override func spec() {

        describe("MLVideoPlayerSpec") {
            it("works") {
                expect(MLVideoPlayer.name) == "MLVideoPlayer"
            }
        }

    }

}
