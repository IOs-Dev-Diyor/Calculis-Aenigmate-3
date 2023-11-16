//
//  MenuVC.swift
//  Calculis Aenigmate
//
//  Created by Shohzod Rajabov on 02/11/23.
//

import UIKit
import SideMenu

class MenuVC: UIViewController {
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    var tableView = UITableView()
    var menuArr = ["Home", "Share", "About", "Quit"]
    
    private let switchMode: UISwitch = {
        let switchs = UISwitch()
        switchs.onTintColor = .Rang.zodiacGreen
        switchs.thumbTintColor = .Rang.zodiacRed
        switchs.layer.cornerRadius = switchs.frame.height / 2.0
        return switchs
    }()
    
    let modeImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .center
        image.image = UIImage(named: "mode")
        return image
    }()
    
    let headerBack: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "header")
        return image
    }()
    
    let modeView: UIView = {
    let view = UIView()
        view.backgroundColor = .yellow.withAlphaComponent(0.6)
        view.layer.cornerRadius = 30
//        view.center = self.view.center
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        return view
    }()
    let headerView = UIView(frame: .zero)
    
    var dimisSide: (_ n: Int) -> () = { n in
        print(n)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        if #available(iOS 11, *) { tableView.contentInsetAdjustmentBehavior = .never }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.backgroundColor = .clear
        headerView.backgroundColor = .Rang.darkPink
        tableView.tableHeaderView = headerView
        
        view.addSubview(tableView)
        
        headerView.addSubview(headerBack)
        headerView.addSubview(modeView)
        modeView.addSubview(modeImage)
        modeView.addSubview(switchMode)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(tableView.snp.top)
            make.width.equalTo(tableView.snp.width)
            make.height.equalTo(view.frame.size.width/2)
        }
        headerView.superview?.layoutIfNeeded()
        
        headerBack.snp.makeConstraints { make in
            make.bottom.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        modeView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(70)
            make.bottom.equalTo(headerView.snp.bottom).offset(-10)
        }
        
        modeImage.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.bottom.equalTo(-20)
//            make.width.equalTo()
        }
        
        switchMode.addTarget(self, action: #selector(modeSetting), for: .valueChanged)
        
        switchMode.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.right.equalTo(-45)
            make.bottom.equalTo(-10)
//            make.width.equalTo(100)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if defaults.bool(forKey: Const.isDark) {
                view.backgroundColor = .Rang.darkBack
                   switchMode.isOn = true
               } else {
                   view.backgroundColor = .Rang.lightBack
                   switchMode.isOn = false
               }
        
            tableView.reloadData()
        }
    
    @objc func modeSetting(_ sender: UISwitch) {
                UserDefaults.standard.set(sender.isOn, forKey: Const.isDark)
        print(sender.isOn)
                if UserDefaults.standard.bool(forKey: Const.isDark) {
                    modeImage.image = UIImage(named: "darkmode")
//                    view.backgroundColor = .Rang.darkBack
//                    sender.isOn = true
    
                } else {
                    modeImage.image = UIImage(named: "lightmode")
//                    view.backgroundColor = .Rang.lightBack
//                    sender.isOn = false
                }
        view.backgroundColor = Rang.tifanyBack.color
        modeView.layer.shadowColor = Rang.tifanyText.color.cgColor
        tableView.reloadData()
        dimisSide(0)
    
            }
    
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! UITableViewCell
        cell.textLabel?.text = menuArr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "Rockwell-Bold", size: 20)
        cell.textLabel?.textColor = Rang.tifanyText.color
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        
        switch indexPath.row {
        case 0:
            dismiss(animated: true)
        case 1:
            shareClicked()
           
        case 2:
            navAbout()
        case 3:
            
            let alertController = UIAlertController(title: "QUIT", message: "ARE YOU SURE?", preferredStyle: .alert)
            let okAction1 = UIAlertAction(title: "OK", style: .default) { _ in
                self.quitClicked()
            }
            
            let okAction2 = UIAlertAction(title: "Cancel", style: .cancel)
            alertController.addAction(okAction1)
            alertController.addAction(okAction2)
            self.present(alertController, animated: true)
            
        default:
            print("Not Fount")
        }
//        dimisSide(indexPath.row)
    }
    
    func navAbout() {
            let vc = AboutVC()
            vc.myTitle = "About"
           navigationController?.pushViewController(vc, animated: true)
    }
    
    func shareClicked(){
            let vc = UIActivityViewController(activityItems: ["https://apps.apple.com"], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true, completion: nil)
        }
    
    func quitClicked(){
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                exit(EXIT_SUCCESS)
            })
        }
}

