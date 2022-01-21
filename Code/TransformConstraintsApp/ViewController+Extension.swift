//
//  ViewController+Extension.swift
//  TransformConstraintsApp
//
//  Created by Waseem on 20/01/2022.
//

import Foundation
import UIKit

extension ViewController
{
    func addRotationObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didOrientationChange(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func didOrientationChange(_ notification: Notification) {
        
        if innerView != nil && outerView != nil
        {
            switch UIDevice.current.orientation
            {
            case .portrait, .portraitUpsideDown:
                applyNormalScreenConstraints()
                break
                
                case .landscapeLeft:
                applyLandscapeScreenConstraints()
                break

                case .landscapeRight:
                applyLandscapeScreenConstraints()
                break

                default:
                applyNormalScreenConstraints()
                break
            }
        }
    }
    
    func removeConstraints()
    {
        NSLayoutConstraint.deactivate(self.landscapeScreenConstraints)
        NSLayoutConstraint.deactivate(self.normalConstraints)
        self.outerView.removeConstraints(self.landscapeScreenConstraints)
        self.innerView.removeConstraints(self.landscapeScreenConstraints)
        self.outerView.removeConstraints(self.normalConstraints)
        self.innerView.removeConstraints(self.normalConstraints)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
        } else {
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation)
    {
        
    }
}
