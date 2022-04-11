//
//  ViewController.swift
//  Dogonyalki
//
//  Created by Сумая on 14/03/22.
//

import UIKit

class MainBoardViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
 
    
   //Число которое пользователь должен угадать
    var guessingNamber: Int = Int.random(in: 1...100)

    //Обшее количество очков играка
    var score: Int = 0
    
    //Начальное количество раундов
    var round: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalThumbImage = UIImage(named: "SliderThumb-Normal")
        let highlightedThumbImage = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(highlightedThumbImage, for: .highlighted)
        
        setUp()
    
    }

    @IBAction func didTapSelectButton(
        sender: Any) {
            showRezult()
//
//        //1.Прочитать число из слайдора.
//
//            let sliderValue: Float = slider.value
//            print("значение слайдера: в Float", sliderValue)
//
//        //2.перевести его значение в целый тип.
//            let sliderValueInt: Int = Int(sliderValue)
//            print("значение слайдора: в Int", sliderValueInt)
//
//        //3.Выполняем условие(проверяем значение слайдора guessnamber).
//
//            let isValueEqaelt = sliderValueInt == guessingNamber
//
//            if isValueEqaelt {
//                print("Вы угадали число")
//                score = score + 1
//            }else {
//                print("Вы выбрали число: \(guessingNamber)")
//
//                //обнавили значение очков(score
//            }
//            updateRound()
//            updataGuessingNamber()
        }
    
   
    @IBAction func didTapAgain(_ sender: Any) {
        setUp()
    }
    
    func setUp() {
        //Настройка начало игры
        //1.усанавливаем начальное заначение слайдора на 50
            
            slider.value = 50
            
        //2.Задать число которое будут угадовать
           
        updataGuessingNamber()
        
        //3.Обнуляем очки
            scoreLabel.text = "Очки: " + String(score)
}

    func updataGuessingNamber(){
        guessingNamber = Int.random(in: 1...100)
        taskLabel.text = "Угадать число: " + String(guessingNamber)
        
    }

    
    
    
   
    
    func updateRound(){
        round = round + 1
        roundLabel.text = "Раунд: " + String(round)
        
    }
    func showRezult(){
        
        //Создаем Alert.
           let alert = UIAlertController(title: "Итоги игры", message: "вы заработали \(score) очков",preferredStyle: .actionSheet)
           
           let okButton: UIAlertAction = UIAlertAction(title: "Начать сначала", style: .default, handler:{ _ in
               print("на меня нажал")
               self.setUp()
           })
                                                     
           
        //ДОБАВЛЯЕМ КНОПКУ В Alert.
           alert.addAction(okButton)
           
        //отобразили Alert на экраню
        present(alert, animated: true)

        
        
    }
  
}


