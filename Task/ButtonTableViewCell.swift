//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Sean Gilhuly on 5/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    // MARK: - IBOutlets and Properties
    
    
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    
    var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    
    // MARK: - Functions

    func updateButton(isComplete: Bool) {
        
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

// MARK: - Protocol and Extension

protocol ButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    
    func updateWithTask(task: Task) {
        
        primaryLabel.text = task.name
        updateButton(task.isComplete.boolValue)
    }
}

