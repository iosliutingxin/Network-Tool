//
//  normal.swift
//  网易
//
//  Created by 李孔文 on 2018/3/19.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit

class normal: UITableViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    var model : baseModel?{
        didSet{
//            得到的
            guard model != nil else {return}
            //定义URL对象
            let url = URL(string: (model?.imgsrc)!)
            //从网络获取数据流
            let data = try! Data(contentsOf: url!)
            //通过数据流初始化图片
            let newImage = UIImage(data: data)
            imageContent.image = newImage
            
            
            titleText.text = model?.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
