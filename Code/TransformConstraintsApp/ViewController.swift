//
//  ViewController.swift
//  TransformConstraintsApp
//
//  Created by Waseem on 20/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var outerView: UIView!
    
    var normalConstraints = [NSLayoutConstraint]()
    var landscapeScreenConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.addRotationObserver()
        
        self.innerView.translatesAutoresizingMaskIntoConstraints = false
        self.outerView.translatesAutoresizingMaskIntoConstraints = false
        self.applyNormalScreenConstraints()
    }
   
    func applyNormalScreenConstraints()
    {
        self.removeConstraints()

        self.outerView.transform = .identity

        normalConstraints.append(contentsOf:[
            NSLayoutConstraint.init(item:self.innerView, attribute:.top, relatedBy:.equal, toItem:self.outerView, attribute: .top, multiplier: 1.0, constant: 10),
            NSLayoutConstraint.init(item:self.innerView, attribute:.bottom, relatedBy:.equal, toItem:self.outerView, attribute: .bottom, multiplier: 1.0, constant: -10),
            NSLayoutConstraint.init(item:self.innerView, attribute:.left, relatedBy:.equal, toItem:self.outerView, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint.init(item:self.innerView, attribute:.right, relatedBy:.equal, toItem:self.outerView, attribute: .right, multiplier: 1.0, constant: -10),
            
            NSLayoutConstraint.init(item:self.outerView, attribute:.centerX, relatedBy:.equal, toItem:self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(item:self.outerView, attribute:.top, relatedBy:.equal, toItem:self.view, attribute: .top, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: self.outerView, attribute: .width, relatedBy:.equal, toItem: self.view, attribute:.width, multiplier: 0.9, constant: 0),
            NSLayoutConstraint(item: self.outerView, attribute: .height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: 100)

        ])
        
        NSLayoutConstraint.activate(self.normalConstraints)
    }
    
    func applyLandscapeScreenConstraints()
    {
        let height = CGFloat(100)
        let outerMargin = CGFloat(10)
        
        self.removeConstraints()

        self.outerView.transform = self.outerView.transform.rotated(by: .pi / 2)

        landscapeScreenConstraints.append(contentsOf:[
            NSLayoutConstraint.init(item:self.innerView, attribute:.top, relatedBy:.equal, toItem:self.outerView, attribute: .top, multiplier: 1.0, constant: 10),
            NSLayoutConstraint.init(item:self.innerView, attribute:.bottom, relatedBy:.equal, toItem:self.outerView, attribute: .bottom, multiplier: 1.0, constant: -1 * outerMargin),
            NSLayoutConstraint.init(item:self.innerView, attribute:.left, relatedBy:.equal, toItem:self.outerView, attribute: .left, multiplier: 1.0, constant: outerMargin),
            NSLayoutConstraint.init(item:self.innerView, attribute:.right, relatedBy:.equal, toItem:self.outerView, attribute: .right, multiplier: 1.0, constant: -1 * outerMargin),
            
            NSLayoutConstraint.init(item:self.outerView, attribute:.centerX, relatedBy:.equal, toItem:self.view, attribute: .trailing, multiplier: 1.0, constant:(-1 * ((height/2) + outerMargin))),
            NSLayoutConstraint.init(item:self.outerView, attribute:.centerY, relatedBy:.equal, toItem:self.view, attribute: .centerY, multiplier: 1.0, constant:0),
            NSLayoutConstraint(item: self.outerView, attribute: .width, relatedBy:.equal, toItem: self.view, attribute:.height, multiplier: 0.9, constant: 0),
            NSLayoutConstraint(item: self.outerView, attribute: .height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: height)
        ])
        
        NSLayoutConstraint.activate(self.landscapeScreenConstraints)
    }
}

