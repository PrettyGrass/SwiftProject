//
//  AdapterCellUtil.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/15.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit
import PGSwiftExtensions

class AdapterCellUtil: NSObject {
    
    //  快速创建基础类型cell
    //
    //
    @discardableResult
   static func creatCell(section: LLTableSection<LLBaseCell<AnyObject>, LLBaseCell<AnyObject>, LLBaseCell<AnyObject>>,text: String ) -> LLTableCell<AnyObject> {
        
        let cell = section.buildAddCell() as! LLTableCell
        cell.text = text
        cell.cellHeight = 50.0
        cell.cellClazz = UITableViewCell.self
        return cell
    }
    
    @discardableResult
    static func creatCell(section: LLTableSection<LLBaseCell<AnyObject>, LLBaseCell<AnyObject>, LLBaseCell<AnyObject>>,text: String ,needSeparator:Bool, cellDidClick:@escaping (_ cell:LLTableCell<AnyObject>,_ index:NSIndexPath) -> Void) -> LLTableCell<AnyObject> {
        
        let cell = self.creatCell(section: section, text: text)
        cell.separatorStyle = needSeparator ? LLTableViewCellSeparatorStyle.inner : LLTableViewCellSeparatorStyle.none
        cell.cellClick = {(cellValue,indexValue) -> () in
            cellDidClick(cellValue! as LLTableCell<AnyObject> ,indexValue! as NSIndexPath)
        }
        return cell
    }
    // 快速创建描述cell
    // 项目中的描述cell
    //
    @discardableResult
    static func descCell(section: LLTableSection<LLBaseCell<AnyObject>, LLBaseCell<AnyObject>, LLBaseCell<AnyObject>>,desc:String) -> LLTableCell<AnyObject> {
        let cell = AdapterCellUtil.creatCell(section: section, text: desc)
        cell.cellClazz = DescCell.self
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.separatorStyle = LLTableViewCellSeparatorStyle.inner 
        cell.loadType = LLCellLoadType.nib
        cell.cellNibName = "DescCell"
        cell.cellIdentity = "DescCell";

        let maxWidth = kScreenWidth - 32.0
        cell.cellHeight = desc.height(maxWidth, font: UIFont.systemFont(ofSize: 14), lineBreakMode: NSLineBreakMode.byWordWrapping) + 10.0;
        return cell
    }

}
