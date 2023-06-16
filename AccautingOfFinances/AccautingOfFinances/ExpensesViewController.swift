//
//  ViewController.swift
//  AccautingOfFinances
//
//  Created by Сергей Сырбу on 07.06.2023.
//

import UIKit
import SnapKit

class ExpensesViewController: UIViewController {

    var stillTyping = false
    let uiView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.2)
//        view.backgroundColor = .gray
        return view
    }()
    let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let oneButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("1", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers(_:)), for: .touchUpInside)
        return button
    }()
    let twoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("2", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers(_:)), for: .touchUpInside)
        return button
    }()
    let threeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("3", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers(_:)), for: .touchUpInside)
        return button
    }()
    let fourButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("4", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers), for: .touchUpInside)
        return button
    }()
    let fiveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("5", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers), for: .touchUpInside)
        return button
    }()
    let sixButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("6", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers), for: .touchUpInside)
        return button
    }()
    let sevenButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("7", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers), for: .touchUpInside)
        return button
    }()
    let eightButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("8", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers), for: .touchUpInside)
        return button
    }()
    let neghtButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("9", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers), for: .touchUpInside)
        return button
    }()
    let zeroButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("0", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(enteringnumbers), for: .touchUpInside)
        return button
    }()
    let cancelButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(cancelNumbers), for: .touchUpInside)
        return button
    }()
    // создание лейблов
    let limitLabel: UILabel = {
        let label = UILabel()
        label.text = "Лимит в месяц:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    let limitValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIConstant.valueColor
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    let availableLabel: UILabel = {
        let label = UILabel()
        label.text = "Доступно для трат:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    let availableValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIConstant.valueColor
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    let wastesLabel: UILabel = {
        let label = UILabel()
        label.text = "Траты за период:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    let wastesValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIConstant.valueColor
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    let limitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Установить лимит", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.2)
//        button.backgroundColor = UIColor.systemGray
        return button
    }()
    let expensesLabel: UILabel = {
        let label = UILabel()
        label.text = "Все расходы:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    let expensesValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIConstant.valueColor
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    //MARK: button category
    let eatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eat"), for: .normal)
        button.setTitle("Еда", for: .normal)
        button.addTarget(self, action: #selector(categoryPressed), for: .touchUpInside)
        var fill = UIButton.Configuration.filled()
        fill.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ income in
            var hui = income
            hui.font = UIFont.systemFont(ofSize: 15)
            return hui
        })
        fill.imagePlacement = .top
        fill.imagePadding = 5
        fill.baseBackgroundColor = .clear
        button.configuration = fill
        return button
    }()
    let hookahButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hookah"), for: .normal)
        button.setTitle("Кальян", for: .normal)
        button.addTarget(self, action: #selector(categoryPressed), for: .touchUpInside)
        var fill = UIButton.Configuration.filled()
        fill.imagePlacement = .top
        fill.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ income in
            var hui = income
            hui.font = UIFont.systemFont(ofSize: 15)
            return hui
        })
        fill.imagePadding = 5
        fill.baseBackgroundColor = .clear
        button.configuration = fill
        return button
    }()
    let barberButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "barber"), for: .normal)
        button.setTitle("Уход", for: .normal)
        button.addTarget(self, action: #selector(categoryPressed), for: .touchUpInside)
        var fill = UIButton.Configuration.filled()
        fill.imagePlacement = .top
        fill.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ income in
            var hui = income
            hui.font = UIFont.systemFont(ofSize: 15)
            return hui
        })
        fill.imagePadding = 5
        fill.baseBackgroundColor = .clear
        button.configuration = fill
        return button
    }()
    let avtoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "car"), for: .normal)
        button.setTitle("Авто", for: .normal)
        button.addTarget(self, action: #selector(categoryPressed), for: .touchUpInside)
        var fill = UIButton.Configuration.filled()
        fill.imagePlacement = .top
        fill.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ income in
            var hui = income
            hui.font = UIFont.systemFont(ofSize: 15)
            return hui
        })
        fill.imagePadding = 10
        fill.baseBackgroundColor = .clear
        button.configuration = fill
        return button
    }()
    let gkuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gku"), for: .normal)
        button.setTitle("ЖКУ", for: .normal)
        button.addTarget(self, action: #selector(categoryPressed), for: .touchUpInside)
        var fill = UIButton.Configuration.filled()
        fill.imagePlacement = .top
        fill.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ income in
            var hui = income
            hui.font = UIFont.systemFont(ofSize: 15)
            return hui
        })
        fill.imagePadding = 7
        fill.baseBackgroundColor = .clear
        button.configuration = fill
        return button
    }()
    let dosugButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dosug"), for: .normal)
        button.setTitle("Досуг", for: .normal)
        button.addTarget(self, action: #selector(categoryPressed), for: .touchUpInside)
        var fill = UIButton.Configuration.filled()
        fill.imagePlacement = .top
        fill.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ income in
            var hui = income
            hui.font = UIFont.systemFont(ofSize: 15)
            return hui
        })
        fill.imagePadding = 7
        fill.baseBackgroundColor = .clear
        button.configuration = fill
        return button
    }()
    
    enum UIConstant {
        static let topEnterLabInset: CGFloat = 100
        static let heightEnterLabel: CGFloat = 60
        static let buttonSize: CGFloat = 60
        static let valueColor: UIColor = .white
        static let labelInset: CGFloat = 10
        static let topLimitInset: CGFloat = 15
        static let topLabelInset: CGFloat = 10
        static let numberButtonInset: CGFloat = 15
        static let topExpenseesInset: CGFloat = 30
        static let numberTopInset: CGFloat = 5
        static let cancelHeight: CGFloat = 125
        static let buttonCategoryTopOffset: CGFloat = 20
        static let buttonCategorylInset: CGFloat = 0

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initialize()
    }

    func initialize(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Путь к миллиону"
        view.backgroundColor = .black
        view.addSubview(uiView)
        uiView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstant.topEnterLabInset)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(UIConstant.heightEnterLabel)
        }
        uiView.addSubview(enterLabel)
        enterLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(UIConstant.topEnterLabInset)
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(UIConstant.heightEnterLabel)
        }
        oneButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        twoButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        threeButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        //MARK: делаем цифры
        let oneToThreeButtonStack = UIStackView()
        oneToThreeButtonStack.axis = .horizontal
        oneToThreeButtonStack.spacing = 5
        oneToThreeButtonStack.addArrangedSubview(oneButton)
        oneToThreeButtonStack.addArrangedSubview(twoButton)
        oneToThreeButtonStack.addArrangedSubview(threeButton)
        view.addSubview(oneToThreeButtonStack)
        oneToThreeButtonStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIConstant.numberButtonInset)
            make.top.equalTo(enterLabel.snp.bottom).offset(UIConstant.topLimitInset)
        }
        fourButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        fiveButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        sixButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        let fourToSixButtonStack = UIStackView()
        fourToSixButtonStack.axis = .horizontal
        fourToSixButtonStack.spacing = 5
        fourToSixButtonStack.addArrangedSubview(fourButton)
        fourToSixButtonStack.addArrangedSubview(fiveButton)
        fourToSixButtonStack.addArrangedSubview(sixButton)
        view.addSubview(fourToSixButtonStack)
        fourToSixButtonStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIConstant.numberButtonInset)
            make.top.equalTo(oneToThreeButtonStack.snp.bottom).offset(UIConstant.numberTopInset)
        }
        sevenButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        eightButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        neghtButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        let sevenToNeightButtonStack = UIStackView()
        sevenToNeightButtonStack.axis = .horizontal
        sevenToNeightButtonStack.spacing = 5
        sevenToNeightButtonStack.addArrangedSubview(sevenButton)
        sevenToNeightButtonStack.addArrangedSubview(eightButton)
        sevenToNeightButtonStack.addArrangedSubview(neghtButton)
        view.addSubview(sevenToNeightButtonStack)
        sevenToNeightButtonStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIConstant.numberButtonInset)
            make.top.equalTo(fourToSixButtonStack.snp.bottom).offset(UIConstant.numberTopInset)
        }
        zeroButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstant.buttonSize)
        }
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.buttonSize)
            make.width.equalTo(UIConstant.cancelHeight)
        }
        let zeroButtonStack = UIStackView()
        zeroButtonStack.axis = .horizontal
        zeroButtonStack.spacing = 5
        zeroButtonStack.addArrangedSubview(zeroButton)
        zeroButtonStack.addArrangedSubview(cancelButton)
        view.addSubview(zeroButtonStack)
        zeroButtonStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIConstant.numberButtonInset)
            make.top.equalTo(sevenToNeightButtonStack.snp.bottom).offset(UIConstant.numberTopInset)
        }
        //MARK: располагаем лейблы
        let limitStack = UIStackView()
        limitStack.axis = .vertical
        limitStack.spacing = 8
        limitStack.addArrangedSubview(limitLabel)
        limitStack.addArrangedSubview(limitValueLabel)
        view.addSubview(limitStack)
        limitStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.labelInset)
            make.top.equalTo(enterLabel.snp.bottom).offset(UIConstant.topLimitInset)
        }
        let availableStack = UIStackView()
        availableStack.axis = .vertical
        availableStack.spacing = 8
        availableStack.addArrangedSubview(availableLabel)
        availableStack.addArrangedSubview(availableValueLabel)
        view.addSubview(availableStack)
        availableStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.labelInset)
            make.top.equalTo(limitStack.snp.bottom).offset(UIConstant.topLabelInset)
        }
        let wastesStack = UIStackView()
        wastesStack.axis = .vertical
        wastesStack.spacing = 8
        wastesStack.addArrangedSubview(wastesLabel)
        wastesStack.addArrangedSubview(wastesValueLabel)
        view.addSubview(wastesStack)
        wastesStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.labelInset)
            make.top.equalTo(availableStack.snp.bottom).offset(UIConstant.topLabelInset)
        }
        view.addSubview(limitButton)
        limitButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.top.equalTo(cancelButton.snp.bottom).offset(10)
            make.width.equalTo(175)
        }
        let expensesStack = UIStackView()
        expensesStack.axis = .vertical
        expensesStack.spacing = 8
        expensesStack.addArrangedSubview(expensesLabel)
        expensesStack.addArrangedSubview(expensesValueLabel)
        view.addSubview(expensesStack)
        expensesStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.labelInset)
            make.top.equalTo(wastesStack.snp.bottom).offset(UIConstant.topExpenseesInset)
        }
//        eatButton.snp.makeConstraints { make in
//            make.width.equalTo(75)
////            make.height.equalTo(70)
//        }
      let buttonCategoryStack = UIStackView()
        buttonCategoryStack.axis = .horizontal
        buttonCategoryStack.spacing = -12
        buttonCategoryStack.addArrangedSubview(eatButton)
        buttonCategoryStack.addArrangedSubview(hookahButton)
        buttonCategoryStack.addArrangedSubview(barberButton)
        buttonCategoryStack.addArrangedSubview(avtoButton)
        buttonCategoryStack.addArrangedSubview(gkuButton)
        buttonCategoryStack.addArrangedSubview(dosugButton)
        view.addSubview(buttonCategoryStack)
        buttonCategoryStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.buttonCategorylInset)
            make.top.equalTo(expensesStack.snp.bottom).offset(UIConstant.buttonCategoryTopOffset)
        }
    }
    @objc func enteringnumbers(_ number:UIButton){
        let number = number.currentTitle
        if stillTyping {
            if let enterCount = enterLabel.text?.count, enterCount < 10 {
                enterLabel.text = enterLabel.text! + (number ?? "nil")
            } } else {
                enterLabel.text = number
                stillTyping = true
            }
        }
    @objc func cancelNumbers(_ number:UIButton){
        enterLabel.text = "0"
        stillTyping = false
    }
    @objc func categoryPressed(_ category: UIButton){
        
    }
}

