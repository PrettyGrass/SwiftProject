//
//  DescCell.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/15.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DescCell: UITableViewCell {

    @IBOutlet weak var descLabel: PGVerticalLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets.zero
        descLabel.verticalAlignment = VerticalAlignment.Top
    }
    
    override func ll_updateUI() {
        descLabel.text = self.ll_model.text ?? "";
    }
}
