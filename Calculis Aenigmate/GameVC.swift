//
//  GameVC.swift
//  Calculis Aenigmate
//
//  Created by Shohzod Rajabov on 02/11/23.
//

import UIKit


class GameVC: UIViewController {
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
   
    let backroundImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "")
        return image
    }()
    
    let restartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("Restart", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        button.layer.cornerRadius = 25
                    button.layer.masksToBounds = false
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 5

        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()
    
    let aQuizImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue.withAlphaComponent(0.5)
        image.layer.masksToBounds = true
        image.contentMode = .center
        image.image = UIImage(named: "a")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        return image
    }()
    
    let bQuizImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue.withAlphaComponent(0.5)
        image.layer.masksToBounds = true
        image.contentMode = .center
        image.image = UIImage(named: "b")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        return image
    }()
    
    let cQuizImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue.withAlphaComponent(0.5)
        image.layer.masksToBounds = true
        image.contentMode = .center
        image.image = UIImage(named: "c")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        return image
    }()
    
    let quizLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .magenta.withAlphaComponent(0.5)
        label.textColor = .black
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.font = UIFont(name: "MarkerFelt-Wide", size: 25)
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

    let aQuizBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 55/2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.roundCorners(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: 55/2)
        return button
    }()
    
    let bQuizBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 55/2
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.roundCorners(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: 55/2)
        return button
    }()
    
    let cQuizBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 55/2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.roundCorners(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: 55/2)
        return button
    }()
    
    let resultLbl: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGreen
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.center = .zero
        label.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        label.layer.cornerRadius = 20
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        label.layer.shadowOffset = CGSize(width: 0.9, height: 2.0)
        label.layer.shadowOpacity = 1.0
//        label.layer.shadowRadius = 0.9
//        label.layer.masksToBounds = false
        label.layer.cornerRadius = 14.0
        return label
    }()
    
    let nextBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setImage(UIImage(named: "next")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    let previousBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setImage(UIImage(named: "left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    let wd = UIScreen.main.bounds.width
    let hd = UIScreen.main.bounds.height

    var countOfQuiz = 0
    var correctAnswer = 0
    var myTitle = ""
    let home = HomeVC()
    

    var quiz = [
        ["2+3=?", "2", "5", "6", "2", "0"],
        ["99+13=?", "112", "114", "111", "1", "0"],
        ["19*11=?", "219", "189", "209", "3", "0"],
        ["36%7=?", "1", "8", "7", "1", "0"],
        ["1998%3=?", "3", "0", "1", "2", "0"],
        ["88/22=?", "4", "3", "1", "1", "0"],
        ["3+x=10, x=?","7", "13", "103", "1", "0"],
        ["3x=36, x=?", "13", "14", "12", "3", "0"]
    ]
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = myTitle
        restartButton.addTarget(self, action: #selector(didTapRestartBtn), for: .touchUpInside)
        aQuizBtn.setTitle("\(quiz[0][1])", for: .normal)
        aQuizBtn.addTarget(self, action: #selector(keyBtnClicked), for: .touchUpInside)
        bQuizBtn.setTitle("\(quiz[0][2])", for: .normal)
        bQuizBtn.addTarget(self, action: #selector(keyBtnClicked), for: .touchUpInside)
        cQuizBtn.setTitle("\(quiz[0][3])", for: .normal)
        cQuizBtn.addTarget(self, action: #selector(keyBtnClicked), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(nextBtnClicked), for: .touchUpInside)
        nextBtn.isEnabled = true
        nextBtn.alpha = 1.0
        previousBtn.addTarget(self, action: #selector(previousBtnClicked), for: .touchUpInside)
        previousBtn.isEnabled = false
        previousBtn.alpha = 0.5
        aQuizImage.layer.cornerRadius = aQuizBtn.layer.cornerRadius
        bQuizImage.layer.cornerRadius = bQuizBtn.layer.cornerRadius
        cQuizImage.layer.cornerRadius = cQuizBtn.layer.cornerRadius
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 30)!]
        
        
        
        view.addSubview(backroundImage)
        view.addSubview(quizLabel)
        view.addSubview(aQuizBtn)
        view.addSubview(bQuizBtn)
        view.addSubview(cQuizBtn)
        view.addSubview(resultLbl)
        view.addSubview(nextBtn)
        view.addSubview(previousBtn)
        aQuizBtn.addSubview(aQuizImage)
        bQuizBtn.addSubview(bQuizImage)
        cQuizBtn.addSubview(cQuizImage)
        view.addSubview(restartButton)
        
       navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back") , style: .plain, target: self, action: #selector(popBatton))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        
        backroundImage.snp.makeConstraints { make in
            make.bottom.top.equalTo(0)
            make.left.right.equalTo(0)
        }
        
        quizLabel.snp.makeConstraints { make in
            make.top.equalTo(restartButton.snp.bottom).offset(25)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(100)
        }

        aQuizBtn.snp.makeConstraints { make in
            make.top.equalTo(quizLabel.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(55)
        }
        
        bQuizBtn.snp.makeConstraints { make in
            make.top.equalTo(aQuizBtn.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(55)
        }

        cQuizBtn.snp.makeConstraints { make in
            make.top.equalTo(bQuizBtn.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(55)
        }
        
        resultLbl.snp.makeConstraints { make in
            make.top.equalTo(cQuizBtn.snp.bottom).offset(25)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(60)
            make.bottom.equalTo(nextBtn.snp.top).offset(-25)
        }

        nextBtn.snp.makeConstraints { make in
            make.top.equalTo(resultLbl.snp.bottom).offset(25)
            make.right.equalTo(-45)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }

        previousBtn.snp.makeConstraints { make in
            make.top.equalTo(resultLbl.snp.bottom).offset(25)
            make.left.equalTo(45)
            make.width.equalTo(100)
            make.height.equalTo(40)
//            make.bottom.equalTo(-50)
        }
        
        aQuizImage.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.height.equalTo(55)
        }
        
        bQuizImage.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.height.equalTo(55)
        }
        
        cQuizImage.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.height.equalTo(55)
        }
        
        restartButton.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.right.equalTo(-25)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        setTextQuiz(countOfQuiz)
        view.backgroundColor = Rang.tifanyBack.color
        restartButton.layer.shadowColor = Rang.tifanyText.color.cgColor
    }
    
    
    
    @objc func popBatton() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func didTapRestartBtn(_ sender: UIButton) {
            sender.pulsate()
        restart()
    }
    
    func restart() {
        countOfQuiz = 0
        correctAnswer = 0
        for i in 0..<(quiz.count){
            quiz[i][5] = "0"
        }
        setTextQuiz(countOfQuiz)
            nextBtn.isEnabled = true
            nextBtn.alpha = 1.0
            previousBtn.isEnabled = false
            previousBtn.alpha = 0.5
            aQuizBtn.backgroundColor = .blue
            bQuizBtn.backgroundColor = .blue
            cQuizBtn.backgroundColor = .blue
        
        defaults.set(quiz, forKey: "quizArr")
        defaults.set(correctAnswer, forKey: "correctAnswer")
            defaults.set(countOfQuiz, forKey: "countOfQuiz")
    }
 
    @objc func nextBtnClicked(_ sender: UIButton){
       
        resultBtnClicked()
        
        if countOfQuiz < quiz.count - 1 {
                countOfQuiz += 1
                setTextQuiz(countOfQuiz)
            
            
        }
            else {
                nextBtn.isEnabled = false
                nextBtn.alpha = 0.5
                let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
                            let action1 = UIAlertAction(title: "TRY AGAIN", style: .cancel) { _ in
//                                if self.correctAnswer < 3 {
                                    self.restart()
//                                }
                               
                            }
                let action2 = UIAlertAction(title: "GO TO THE NEXT LEVEL", style: .default) { _ in
//                                if self.correctAnswer > 3 {
                                    self.navigationController?.popViewController(animated: true)
//                                }

                            }
                if correctAnswer <= 3 {
                    alert.addAction(action1)
                    alert.title = "SORRY!"
                    alert.message = "YOUR RESULT IS NOT GOOD"
                } else /*if correctAnswer > 3*/ {
                    alert.addAction(action2)
                    alert.title = "GOOD RESULT!"
                    alert.message = "KEEP LOOKING FOR GREAT RESULTS"
                }
                            
                            present(alert, animated: true)
               
            }
        
        previousBtn.isEnabled = true
        previousBtn.alpha = 1
        
    }
    
    @objc func previousBtnClicked(_ sender: UIButton){
        
        if countOfQuiz > 0 {
               countOfQuiz -= 1
               setTextQuiz(countOfQuiz)
            
               nextBtn.isEnabled = true
               nextBtn.alpha = 1.0
            
           }
        else {
            previousBtn.isEnabled = false
            previousBtn.alpha = 0.5

        }
        
            nextBtn.isEnabled = true
            nextBtn.alpha = 1
        
    }
    
    
    @objc func keyBtnClicked(_ sender: UIButton){
        aQuizBtn.backgroundColor = .blue
        bQuizBtn.backgroundColor = .blue
        cQuizBtn.backgroundColor = .blue
        sender.backgroundColor = .orange
    }
    
    
     func resultBtnClicked(){
        let rightKey = Int(quiz[countOfQuiz][4])

        if aQuizBtn.backgroundColor == .orange {
            quiz[countOfQuiz][5] = "1"

            if  rightKey  == 1 {
                correctAnswer += 1
            } else {
                clickedKeyFalse(aQuizBtn)
            }
        } else if bQuizBtn.backgroundColor == .orange {
            quiz[countOfQuiz][5] = "2"

            if  rightKey  == 2 {
                correctAnswer += 1
            } else {
                clickedKeyFalse(bQuizBtn)
            }
        } else if cQuizBtn.backgroundColor == .orange {
            quiz[countOfQuiz][5] = "3"

            if  rightKey  == 3 {
                correctAnswer += 1
            } else {
                clickedKeyFalse(cQuizBtn)
            }
        } else {

        }

    }
    
    func clickedKeyfalsetTrue(_ button: UIButton) {
        button.backgroundColor = .green
    }

    func clickedKeyFalse(_ button: UIButton) {
        button.backgroundColor = .red
    }

    func setTextQuiz(_ count: Int){
        resultLbl.text = "Score: \(correctAnswer)"
        quizLabel.text = "\(countOfQuiz + 1). \(quiz[count][0])"
        aQuizBtn.setTitle("\(quiz[count][1])", for: .normal)
        bQuizBtn.setTitle("\(quiz[count][2])", for: .normal)
        cQuizBtn.setTitle("\(quiz[count][3])", for: .normal)
        
        aQuizBtn.backgroundColor = .blue
        bQuizBtn.backgroundColor = .blue
        cQuizBtn.backgroundColor = .blue
       
        if quiz[count][5] != "0" {
            clickedKeyfalsetTrue(Int(quiz[count][4]) ?? 0)
            if quiz[count][4] != quiz[count][5] {
                clickedKeyFalse(Int(quiz[count][5]) ?? 0)

            }
        }        
    
    }

    func clickedKeyfalsetTrue(_ trueKey: Int) {
        switch trueKey {
            case 1:
                aQuizBtn.backgroundColor = .green
            case 2:
                bQuizBtn.backgroundColor = .green
            case 3:
                cQuizBtn.backgroundColor = .green
            default:
                cQuizBtn.backgroundColor = .blue
        }
        
    }

func clickedKeyFalse(_ trueKey: Int) {
        switch trueKey {
            case 1:
                aQuizBtn.backgroundColor = .red
            case 2:
                bQuizBtn.backgroundColor = .red
            case 3:
                cQuizBtn.backgroundColor = .red
            default:
                cQuizBtn.backgroundColor = .black
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            quizLabel.textColor = .Rang.zodiaclight
            restartButton.layer.shadowColor = UIColor.Rang.darkBlue.cgColor
            aQuizBtn.setTitleColor(UIColor.Rang.zodiaclight, for: .normal)
            bQuizBtn.setTitleColor(UIColor.Rang.zodiaclight, for: .normal)
            cQuizBtn.setTitleColor(UIColor.Rang.zodiaclight, for: .normal)
            restartButton.setTitleColor(UIColor.Rang.tifBrounLight, for: .normal)
            resultLbl.textColor = .Rang.zodiaclight
            nextBtn.tintColor = .Rang.zodiaclight
            previousBtn.tintColor = .Rang.zodiaclight
        } else {
            view.backgroundColor = .Rang.zodiaclight
            quizLabel.textColor = .Rang.darkBack
            restartButton.layer.shadowColor = UIColor.Rang.darkBack.cgColor
            aQuizBtn.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            bQuizBtn.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            cQuizBtn.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            restartButton.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            resultLbl.textColor = .Rang.darkBack
            nextBtn.tintColor = .Rang.darkBack
            previousBtn.tintColor = .Rang.darkBack
        }
        
       
    }

}
