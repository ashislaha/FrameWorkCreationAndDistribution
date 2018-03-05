//
//  ALModalStatusView.swift
//  ALModalStatus
//
//  Created by Ashis Laha on 05/03/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

public class ALModalStatusView: UIView {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private let nibName = "ALModalStatusView"
    var contentView: UIView!
    
    // MARK: Set up views
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
    
    // Allow view to control itself
    public override func layoutSubviews() {
        // Rounded corners
        layoutIfNeeded()
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    // MARK: update UI
    public func set(image: UIImage) {
        imageView.image = image
    }
    
    public func set(title: String) {
        titleLabel.text = title
    }
    
    public func set(description: String) {
        descriptionLabel.text = description
    }
}
