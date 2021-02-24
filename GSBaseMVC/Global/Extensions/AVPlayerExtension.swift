//
//  AVPlayerExtension.swift
//  Unbox
//
//  Created by Gati on 03/02/21.
//  Copyright © 2021 Thinkfirst Education Pvt Ltd. All rights reserved.
//

import Foundation
import AVKit

extension AVPlayerViewController {
    func enterFullScreen(animated: Bool) {
        perform(NSSelectorFromString("enterFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
    func exitFullScreen(animated: Bool) {
        perform(NSSelectorFromString("exitFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
}
