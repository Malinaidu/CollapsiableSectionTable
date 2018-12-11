//
//  CollapsibleTableViewHeader.swift
//  CollapsibleTableSectionViewController
//
//  Created by Yong Su on 7/20/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ section: Int)
}

open class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    let arrowLabel = UILabel()
    let arrowImgView = UIImageView()
    let separatorView = UIView()
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
        contentView.backgroundColor = UIColor.white//UIColor(hex: 0x2E3944)
        let marginGuide             = contentView.layoutMarginsGuide
        
        // Title label
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.init(red: 75.0/255.0, green: 78.0/255.0, blue: 83.0/255.0, alpha: 1)
        titleLabel.font = UIFont(name: "Verdana", size: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive           = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        //titleLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor).isActive      = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive   = true
        
        
        contentView.addSubview(arrowImgView)
        arrowImgView.image = UIImage(named: "SelectionIndicatorDown")
        arrowImgView.translatesAutoresizingMaskIntoConstraints = false
        arrowImgView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        arrowImgView.widthAnchor.constraint(equalToConstant: 19).isActive  = true
        arrowImgView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        arrowImgView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        // Separator UIView
        contentView.addSubview(separatorView)
        separatorView.backgroundColor = UIColor.lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive     = true
        separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive   = true
        separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant:0.8).isActive                   = true
        
        
        //
        // Call tapHeader when tapping on this header
        //
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        _ = delegate?.toggleSection(cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        //arrowImgView.rotate(collapsed ? 0.0 : .pi / 2)
        if collapsed {
            arrowImgView.image = UIImage(named: "SelectionIndicatorDown")
            separatorView.isHidden = false
        }else{
            arrowImgView.image = UIImage(named: "SelectionIndicatorUp")
            separatorView.isHidden = true
        }
        
    }
    
}

extension UIColor {
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
}

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue  = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
    
}


