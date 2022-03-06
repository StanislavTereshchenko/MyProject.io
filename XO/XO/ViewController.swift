//
//  ViewController.swift
//  XO
//
//  Created by Stanislav Tereshchenko on 17.01.2022.
//

import UIKit

class ViewController: UIViewController {
    let userChart = "X"
    let compChart = "0"
    let defaultChart = "*"
    
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startAgainButton: UIButton!
    
    @IBOutlet weak var xTextField: UITextField!
    
    @IBOutlet weak var oTextField: UITextField!
    @IBOutlet var fieldsImageView: [UIImageView]!
    
    var fieldsItems = [
        ["*", "*", "*"],
        ["*", "*", "*"],
        ["*", "*", "*"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startAgainButton.isEnabled = false
    }
    //----------------------------------------------------- Start again Button ------------------------------------------------------
    
    func playAgainButton () {
        for i in 0..<fieldsItems.count {
            for j in 0..<fieldsItems[i].count {
                if fieldsItems[i][j] != "*" {
                    fieldsItems[i][j] = "*"
                }
            }
        }
    }
    
    
    @IBAction func startAgainTochDown(_ sender: Any) {
        
        startAgainButton.isEnabled = false
        playAgainButton()
        
        draw()
    }
    
    //----------------------------------------------------- Set Button --------------------------------------------------------------
    
    @IBAction func setOnTochDown(_ sender: Any) {
        
        guard let xText = xTextField.text,
              let yText = oTextField.text,
              let x = Int(xText),
              let y = Int(yText)
        else { return }
        
        if fieldsItems[y][x] != defaultChart {
            titleLabel.text = "EROR"
            titleLabel.textColor = .red
            return
        }
        
        fieldsItems[y][x] = "X"
        draw()
        
        if isFirstRowWin(with: userChart) || isSecondRowWin(with: userChart) || isThirdRowWin(with: userChart) || isFirstColumnWin(with: userChart) || isSecondColumnWin(with: userChart) || isThirdColumnWin(with: userChart) || isLeftDiagonalWin(with: userChart) || isRightDiagonalWin(with: userChart)
        {
            titleLabel.text = "You win!!!"
            startAgainButton.isEnabled = true
            playAgainButton()
            return
        }
        
        playComputer()
        
        if isFirstRowWin(with: compChart) || isSecondRowWin(with: compChart) || isThirdRowWin(with: compChart) || isFirstColumnWin(with: compChart) || isSecondColumnWin(with: compChart) || isThirdColumnWin(with: compChart) || isLeftDiagonalWin(with: compChart) || isRightDiagonalWin(with: compChart)
        {
            titleLabel.text = "Computer win!!!!!!"
            startAgainButton.isEnabled = true
            playAgainButton()
            return
        }
    }
    
    //--------------------------------------------------- check if row  win ---------------------------------------------------------
    
    func isFirstRowWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if i == 0 && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    func isSecondRowWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if i == 1 && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    func isThirdRowWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if i == 2 && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    //-------------------------------------------------- check if coulumn win -------------------------------------------------------
    
    func isFirstColumnWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if j == 0 && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    func isSecondColumnWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if j == 1 && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    func isThirdColumnWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if j == 2 && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    //-------------------------------------------------- check if diagonals win -----------------------------------------------------
    
    func isLeftDiagonalWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if i==j && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    func isRightDiagonalWin(with char: String) -> Bool {
        var count = 0
        for i in 0..<fieldsItems.count{
            for j in 0..<fieldsItems[i].count {
                if i==fieldsItems.count - 1 - j && fieldsItems[i][j] == char {
                    count += 1
                }
            }
        }
        return count == 3
    }
    
    //-------------------------------------------------- func play computer ---------------------------------------------------------
    
    func playComputer() {
        
        for i in 0..<fieldsItems.count {
            for j in 0..<fieldsItems[i].count{
                if fieldsItems[i][j] == "*" {
                    fieldsItems[i][j] = "0"
                    draw()
                    return
                }
            }
        }
    }
    
    //-------------------------------------------------- func draw ------------------------------------------------------------------
    
    
    func draw() {
        var imgIndex = 0
        for items in fieldsItems {
            for item in items {
                switch item{
                case "*":
                    fieldsImageView[imgIndex].image = UIImage(systemName: "rectangle.and.hand.point.up.left.fill")
                case "X":
                    fieldsImageView[imgIndex].image = UIImage(named: "icon.x")
                case "0":
                    fieldsImageView[imgIndex].image = UIImage(named:  "icon.o")
                default:
                    break
                }
                
                imgIndex += 1
            }
        }
    }
}

