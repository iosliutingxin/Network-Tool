//
//  ViewController.swift
//  网易
//
//  Created by 李孔文 on 2018/3/17.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit
private let cellID = "normolcell"
class ViewController: BaseController {
    
    //懒加载倒计时
    lazy var countDoweView : countDown = {
        
        let countDoweView = countDown.initCountDownView()
        countDoweView.frame = view.bounds
        return countDoweView
        }()
    //数据源
    fileprivate lazy var newsModels : [baseModel] = [baseModel]()
    
    //UITableView
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "normal", bundle: nil), forCellReuseIdentifier: cellID)
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //1、设置UI界面
        setNavegationView()
        
        //2、加载UITableView
        //contentView用于接收内容显示的页面
        contentView = tableView
        view.addSubview(tableView)
        setupUI()

        //3、请求数据
        loadDate()
        
        //3、倒计时
//        view.addSubview(countDoweView)
        
        //4、通知
        isAllowedNotification()
        }
}

//设置UI界面
extension ViewController{

  fileprivate func setNavegationView() {
    //隐藏导航栏
//    navigationController?.setNavigationBarHidden(true, animated: false)
    //设置背景图片
    navigationController?.navigationBar.setBackgroundImage(UIImage(named: "headBackView"), for: .default)
    //设置标题
    navigationItem.titleView = UIImageView(image: UIImage(named: "btn_bubble"))
    //设置收索按钮
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_home_search"), style: .plain, target: self, action: #selector(clinkRight))
    let navegationView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    navegationView.backgroundColor = UIColor.red
    navigationItem.titleView = navegationView
    }
    @objc func clinkRight() {
        
        print("clink right")
        
    }
}

//请求数据
extension ViewController{
  
    fileprivate func loadDate(){
        NetworkTools.requestDate(url: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get, parameters: nil) { (response) in
            //1、将any类型转为字典
            guard let resultDict = response as? [String : Any] else {return}
            //2、将字典转为数组
            guard let dataArray = resultDict["T1348649079062"] as? [[String : Any]] else {return}
            //3遍历数组
            for dict in dataArray{
                let model = baseModel(dict: dict)
                self.newsModels.append(model)
            }
            //显示内容view
            self.loadDateFinished()
            //加载数据
            self.tableView.reloadData()
        }
    }
}
//设置UITableView
extension ViewController : UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModels.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:cellID , for: indexPath) as! normal
        cell.model = newsModels[indexPath.row] as baseModel
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath.row % 2 == 0 ? presentShowVC() : pushVC()
    }
    
    func presentShowVC()  {
        
        let room01 = RoomController()
        present(room01, animated: true, completion: nil)
        
    }
    
    func pushVC()  {
        
        let room02 = Room2ViewController()
        navigationController?.pushViewController(room02, animated: true)
    }
    
}

extension ViewController {
    //判断有没有开启通知
    func isAllowedNotification() {
        let setting = UIApplication.shared.currentUserNotificationSettings
        guard setting?.types.rawValue != 0 else {
            return
            print("没有通知-------")
        }
        print("通知存在")
     
        
    }
}




