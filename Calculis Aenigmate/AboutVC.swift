//
//  AboutVC.swift
//  Calculis Aenigmate
//
//  Created by Shohzod Rajabov on 02/11/23.
//

import UIKit

class AboutVC: UIViewController {
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    let textLabel: UILabel = {
      let label = UILabel()
        label.backgroundColor = .magenta.withAlphaComponent(0.1)
        label.text = """
Mathematics has many applications in various fields, including science, engineering, finance, computer science, medicine, and more. Here are some specific areas where mathematics finds applications and its respective benefits:
Science and Engineering: Mathematics helps in formulating and solving complex equations and modeling physical phenomena. In fields such as physics, chemistry, biology, and engineering, data analysis, prediction, and understanding of the natural world are essential.
"""
        label.numberOfLines = .zero
        label.textColor = .black
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.font = UIFont(name: "Menlo-BoldItalic", size: 20)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.cornerRadius = 30
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.white.cgColor
        label.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius:30)
        return label
    }()
    
    let imageAbout: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "about")
        image.layer.borderColor = UIColor.magenta.cgColor
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 16
        return image
    }()
    
    var myTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textLabel)
        view.addSubview(imageAbout)
        title = myTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
       
        imageAbout.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(200)
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(imageAbout.snp.bottom).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(5)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(didTapBack))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if defaults.bool(forKey: Const.isDark) {
                view.backgroundColor = .Rang.darkBack
                textLabel.textColor = UIColor.Rang.zodiaclight
//                   switchMode.isOn = true
               } else {
                   view.backgroundColor = .Rang.lightBack
                   textLabel.textColor = UIColor.Rang.darkBack
//                   switchMode.isOn = false
               }
        
        }

}
