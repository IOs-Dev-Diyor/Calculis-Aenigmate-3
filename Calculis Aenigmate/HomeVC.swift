//
//  HomeVC.swift
//  Calculis Aenigmate
//
//  Created by Shohzod Rajabov on 02/11/23.
//

import UIKit
import SideMenu
import SnapKit



class HomeVC: UIViewController {
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    let wd = UIScreen.main.bounds.width
    var mg: CGFloat = 15
    lazy var x = (wd - 12*mg)/4
    var tags = 0
    var correct = 0
    var countQuiz = 0
    
    private let starIcon1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullstar")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let starIcon2: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let starIcon3: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var arr2 = [
        ["|5 - 10| = ?", "3", "5", "6",  "2", "0"],
        ["21 / 2 = ? ", "10", "10.5", "11", "2", "0"],
        ["22 * 2 = ?", "44", "43", "46", "1", "0"],
        ["(10 - 2) / 8 = ?", "0.7", "0.9", "1", "3", "0"],
        ["(28 - 2) / 2 = ?", "13", "11", "12", "1", "0"],
        ["(|2 - 9|) = ?", "6", "7", "-4", "2", "0"],
        ["(|5 - 15|) / 2.5 = ?", "2", "-3", "4", "3", "0"],
        ["20x - 12 = 8, x=?", "0.8", "2", "-1", "2", "0"],
    ]
    
    var arr3 = [
        ["10x - 2 = 3, x=?", "0.3", "0.5", "0.6",  "2", "0"],
        ["z - 2 = 3, z=?", "3", "5", "6", "2", "0"],
        ["2y - 2 = 3, y=?", "2.5", "0.3", "1.6", "1", "0"],
        ["10x - 2x = 8, x=?", "0.7", "0.9", "1", "3", "0"],
        ["11z - 2z = 18, z=?", "2", "1", "3", "1", "0"],
        ["2y - 9 = 3, y=?", "3", "6", "4", "2", "0"],
        ["5x - 5 = 15, x=?", "2", "3", "4", "3", "0"],
        ["20x - 2 = 8, x=?", "0.3", "0.5", "0.6", "2", "0"],
    ]
  
    var arr4 = [
        ["60x - 20 = 100, x=?", "2", "1", "3", "1", "0"],
        ["72z + 12 = 24, z=?", "5", "6", "7", "2", "0"],
        ["4x * 25 = 100, x=?", "3", "1", "2", "3", "0"],
        ["6t + 20 = 80, t=?", "10", "11", "13", "1", "0"],
        ["8x - 20 = 100, x=?", "12", "10", "13", "2", "0"],
        ["110y - 10 = 100, y=?", "2", "3", "1", "3", "0"],
        ["60x / 20 = 6, x=?", "2", "1", "3", "1", "0"],
        ["30k / 10 = 60, k=?", "30", "20", "40", "2", "0"],
    ]
  
    var arr5 = [
        ["√64x + 20 = 100, x=?", "11", "12", "10", "3", "0"],
        ["√16n + 12 = 20, n=?", "2", "4", "3", "1", "0"],
        ["√4x * 25 = 100, x=?", "3", "2", "1", "2", "0"],
        ["√16c + 20 = 80, c=?", "10", "11", "15", "3", "0"],
        ["8x + 80 = 40, |x|=?", "5", "-6", "4", "1", "0"],
        ["√100y - 10 = 100, y=?", "7", "10", "11", "3", "0"],
        ["√36x / 20 = 6, x=?", "22", "20", "23", "2", "0"],
        ["√16w / 10 = -6, w=?", "-15", "-14", "13", "1", "0"],
    ]
  
    var arr6 = [
        ["|√64c + 20| = -100, c=?", "-11", "12", "10", "3", "0"],
        ["√16x + 12 = -24, |x|=?", "9", "-8", "11", "1", "0"],
        ["√4z * 5 = √100, z=?", "3", "1", "2", "2", "0"],
        ["√64x + √64 = 80, x=?", "10", "11", "9", "3", "0"],
        ["√400f + 80 = -40, |f|=?", "6", "-5", "4", "1", "0"],
        ["√100x - 10 = √400, x=?", "7", "5", "6", "2", "0"],
        ["√36y / 20 = -6, |y|=?", "22", "-21", "20", "3", "0"],
        ["√16z / 10 = -6, z=?", "-15", "-14", "13", "1", "0"],
    ]
    
    var arr7 = [
        ["|√100 - √81c| = -100, c=?", "-11", "12", "-10", "3", "0"],
        ["√x + 12 = 28, |x|=?", "4", "-2", "3", "1", "0"],
        ["√4z * √4 = √100, z=?", "3", "2.5", "2", "2", "0"],
        ["√64x + √144 = 80, x=?", "5", "3", "4", "3", "0"],
        ["√400f - √10000 = -40, |f|=?", "3", "-5", "4", "1", "0"],
        ["√10000x - 100 = 400, x=?", "7", "5", "6", "2", "0"],
        ["√36y / √64 = -6, |y|=?", "7", "-9", "8", "3", "0"],
        ["√3600z / 10 = -6, z=?", "-1", "-4", "3", "1", "0"],
    ]
  
    var arr8 = [
        ["√1c + √81c = -10^2, c=?", "-11", "12", "-10", "3", "0"],
        ["√1x + √36x = 28, |x|=?", "4", "-2", "3", "1", "0"],
        ["√4z * √4 = √64, z=?", "3", "2", "2.5", "2", "0"],
        ["√9x + √49x = 80, x=?", "7", "9", "8", "3", "0"],
        ["√121f + f = -48, |f|=?", "4", "-5", "3", "1", "0"],
        ["√10000x - 10^2 = 20^2, x=?", "7", "5", "6", "2", "0"],
        ["√121y / √64 = -11, |y|=?", "7", "-9", "8", "3", "0"],
        ["√3600z / 10^2 = -6, z=?", "-10", "-11", "13", "1", "0"],
    ]
    
    var arr9 = [
        ["ƒ(c) = 2c - 9c, ƒ(1)=?", "-11", "8", "-7", "3", "0"],
        ["ƒ(x) = 2 + 6x, ƒ(4)=?", "26", "-27", "23", "1", "0"],
        ["ƒ(z) = 3z + 8, ƒ(-2)=?", "3", "2", "2.5", "2", "0"],
        ["ƒ(x) = 9x - 7x, ƒ(-1)=?", "4", "3", "2", "3", "0"],
        ["ƒ(x) = √121x + x, ƒ(2)=?", "24", "-25", "23", "1", "0"],
        ["ƒ(x) = x - 10, ƒ(15)=?", "7", "5", "6", "2", "0"],
        ["ƒ(y) = 8y / √64, ƒ(8)=?", "7", "-9", "8", "3", "0"],
        ["ƒ(z) = z / 10, ƒ(-10)=?", "-1", "-2", "3", "1", "0"],
    ]
    
    var arr10 = [
        ["ƒ(c) = c + √4c, ƒ(-2)=?", "-8", "7", "-6", "3", "0"],
        ["ƒ(x) = |√100 - 6x|, ƒ(4)=?", "14", "-17", "13", "1", "0"],
        ["ƒ(z) = 3z - 8√z, ƒ(9)=?", "2", "3", "2.5", "2", "0"],
        ["ƒ(x) = 2x - 7√x, ƒ(4)=?", "-8", "7", "-6", "3", "0"],
        ["ƒ(x) = √16x - x, ƒ(2)=?", "6", "-5", "4", "1", "0"],
        ["ƒ(x) = √x - 10, ƒ(16)=?", "7", "-6", "6", "2", "0"],
        ["ƒ(y) = √9y / √64, ƒ(8)=?", "4", "-2", "3", "3", "0"],
        ["ƒ(z) = √z / 10, ƒ(100)=?", "1", "-2", "3", "1", "0"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        let game = GameVC()
        game.correctAnswer = correct
       title = "Home"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 25)!]

        levelButton()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu") , style: .plain, target: self, action: #selector(leftClick))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
   
   
    @objc func leftClick() {
        let vc = MenuVC()
        let menu = SideMenuNavigationController(rootViewController: vc)
        menu.leftSide = true
        menu.presentationStyle = .menuDissolveIn
        menu.menuWidth = UIScreen.main.bounds.width * 0.8
        vc.dimisSide = { _ in
            
            if self.defaults.bool(forKey: Const.isDark) {
                self.view.backgroundColor = .Rang.darkBack
            } else {
                self.view.backgroundColor = .Rang.lightBack
            }
        }
        present(menu, animated: true, completion: nil)
    }


    
    private func levelButton() {
        for i in 0...9 {
            let levelButton = UIButton()
            levelButton.frame = CGRect(x: 20,
                                       y: 110 + CGFloat(i)*(mg + x) + mg,
                                       width: wd - 40,
                                       height: x)
                    levelButton.setTitle("Level \(tags + 1)", for: .normal)
                    levelButton.titleLabel?.font =  UIFont(name: "MarkerFelt-Wide", size: 20)
                    levelButton.layer.cornerRadius = 12
                    levelButton.tag = tags
            
            if levelButton.tag == 0 {
                levelButton.backgroundColor = .green
            } else if levelButton.tag == 1 {
                levelButton.backgroundColor = .magenta
            } else if levelButton.tag == 2 {
                levelButton.backgroundColor = .red
            } else if levelButton.tag == 3 {
                levelButton.backgroundColor = .cyan
            } else if levelButton.tag == 4 {
                levelButton.backgroundColor = .orange
            } else if levelButton.tag == 5 {
                levelButton.backgroundColor = .yellow
            } else if levelButton.tag == 6 {
                levelButton.backgroundColor = .brown
            } else if levelButton.tag == 7 {
                levelButton.backgroundColor = .blue
            } else if levelButton.tag == 8 {
                levelButton.backgroundColor = .purple
            } else if levelButton.tag == 9 {
                levelButton.backgroundColor = .Rang.darkGreen
            }
            
            levelButton.layer.masksToBounds = false
            levelButton.layer.shadowRadius = 12
            levelButton.layer.shadowOpacity = 5

            levelButton.layer.shadowOffset = CGSize(width: 1, height: 1)
            levelButton.layer.shouldRasterize = true
           
//            levelButton.layer.shadowColor = UIColor.Rang.darkPink.cgColor
                levelButton.setTitleColor(UIColor.gray, for: .normal)
            
            levelButton.layer.rasterizationScale = UIScreen.main.scale
                    levelButton.addTarget(self, action: #selector(didTapLevelButton), for: .touchUpInside)
                    view.addSubview(levelButton)

                    levelButton.addSubview(starIcon1)
                    levelButton.addSubview(starIcon2)
                    levelButton.addSubview(starIcon3)
                    tags += 1
        }
    }
    
    
    @objc func didTapLevelButton(_ sender: UIButton) {
        if sender.tag == 0 {
            let vc = GameVC()
            vc.myTitle = "Level 1"
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        
        } else if sender.tag == 1 {
            let vc1 = GameVC()
            vc1.myTitle = "Level 2"
            vc1.quiz = [[String]]()
            vc1.quiz = arr2
            navigationController?.pushViewController(vc1, animated: true)
                    
        }
        
        else if sender.tag == 2 {
            let vc = GameVC()
            vc.myTitle = "Level 3"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr3)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        }

        else if sender.tag == 3 {
            let vc = GameVC()
            vc.myTitle = "Level 4"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr4)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        }

        else if sender.tag == 4 {
            let vc = GameVC()
            vc.myTitle = "Level 5"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr5)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 5 {
            let vc = GameVC()
            vc.myTitle = "Level 6"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr6)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 6 {
            let vc = GameVC()
            vc.myTitle = "Level 7"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr7)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 7 {
            let vc = GameVC()
            vc.myTitle = "Level 8"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr8)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 8 {
            let vc = GameVC()
            vc.myTitle = "Level 9"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr9)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 9 {
            let vc = GameVC()
            vc.myTitle = "Level 10"
            vc.quiz = [[String]]()
            vc.quiz.append(contentsOf: arr10)
            print(self.navigationController ?? "") // returns nil
                    self.navigationController?.pushViewController(vc, animated: true)
        }
        
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
        } else {
            view.backgroundColor = .Rang.zodiaclight
        }
        

    }
    
}

