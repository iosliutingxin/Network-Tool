//
//  menuView.swift
//  网易
//
//  Created by 李孔文 on 2018/3/27.
//  Copyright © 2018年 李孔文. All rights reserved.
//
//-------------------------------------抽屉效果-----------------------------------------------------

import UIKit
private let cellID = "cell"
class menuView: UIView {
    
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var con: UIView!
    @IBOutlet weak var table: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置手势点击数,双击：点2下
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clink))
        tapGesture.numberOfTapsRequired = 1
        con.addGestureRecognizer(tapGesture)
        
        table.backgroundColor = UIColor.red
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 80
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
 
        
    }
    
}

//快速创建nib
extension menuView{
    class func createMenu() -> menuView{
        
      return  Bundle.main.loadNibNamed("menuView", owner: nil, options: nil)?.first as! menuView
        
    }
    
    @objc func clink() {
        UIView.animate(withDuration: 0.3, animations: {
//            self.table.contentOffset = CGPoint(x: 139, y: -50)
            self.content.bounds.size.width = 100
        }) { (finish) in
            print("动画")
            self.removeFromSuperview()

        }

    
    }
}

extension menuView : UITableViewDataSource ,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.red : UIColor.black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了----》\(indexPath.row)")
    }
}


