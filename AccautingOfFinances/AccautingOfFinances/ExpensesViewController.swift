//
//  ViewController.swift
//  AccautingOfFinances
//
//  Created by Сергей Сырбу on 07.06.2023.
//

import UIKit
import SnapKit
import RealmSwift
class ExpensesViewController: UIViewController {
    let realm = try! Realm()
    var spandingArray:Results<Spending>!
    
    let tableView: UITableView = .init()
    
    var stillTyping = false
    var categoryName = ""
    var displayValue: Int = 1
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
        button.addTarget(self, action: #selector(appLimit(_:)), for: .touchUpInside)
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
        leftLabel()
        allSpendinf()
        spandingArray = realm.objects(Spending.self )
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
        tableView.register(FinanceCell.self, forCellReuseIdentifier: "FinanceCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(buttonCategoryStack.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    @objc func enteringnumbers(_ number:UIButton){
        let number = number.currentTitle
        if number == "0" && enterLabel.text == "0"{
            stillTyping = false
        } else {
            if stillTyping {
                if let enterCount = enterLabel.text?.count, enterCount < 10 {
                    enterLabel.text = enterLabel.text! + (number ?? "nil")
                } } else {
                    enterLabel.text = number
                    stillTyping = true
                }
        } }
    @objc func cancelNumbers(_ number:UIButton){
        enterLabel.text = "0"
        stillTyping = false
    }
    @objc func categoryPressed(_ category: UIButton){
        categoryName = category.currentTitle ?? "nil"
        displayValue = Int(enterLabel.text ?? "nil") ?? 1
        enterLabel.text = "0"
        stillTyping = false
        //проверка
        let value = Spending(value: ["\(categoryName)", displayValue])
        try! realm.write {
            realm.add(value)
        }
        leftLabel()
        allSpendinf()
        tableView.reloadData() // после нажатия, таблица и база данных обновляется
    }
    @objc func appLimit(_ number: UIButton){
        let alert = UIAlertController(title: "Установить лимит", message: "Ваш лимит", preferredStyle: .alert)
        let action = UIAlertAction(title:"Ок", style: .default) {_ in
            let sumDay = alert.textFields?[0].text
            let sumMoney = alert.textFields?[1].text
            guard sumDay != "" && sumMoney != "" else {return}
            self.limitValueLabel.text = sumDay
            if let day = sumDay {
                let dateNow = Date() // записываем время на момент нажатия кнопки
                let lastDay: Date = dateNow.addingTimeInterval(60*60*24*Double(day)!) //прибавляем интервал в днях, который указал пользователь

                let limit = self.realm.objects(Limit.self) // переменная которая содержит все значения БД ЛИМИТ
                if limit.isEmpty { //если бд пустая
                    let value = Limit(value: [self.limitValueLabel.text!, dateNow, lastDay])
                    try! self.realm.write {
                        self.realm.add(value)
                    }
                } else { // перезаписываем данные
                    try! self.realm.write{
                        limit[0].limitSum = self.limitValueLabel.text!
                        limit[0].limitDay = dateNow as Date
                        limit[0].limitLastDay = lastDay as Date
                    }
                }
            }
            self.leftLabel()
        }
            let actionCancel = UIAlertAction(title:"Отмена", style: .cancel) {_ in
            }
            alert.addTextField { textField in
                textField.placeholder = "Введите сумму"
                textField.keyboardType = .asciiCapableNumberPad
            }
            alert.addTextField { textField in
                textField.placeholder = "Введите количество дней"
                textField.keyboardType = .asciiCapableNumberPad
            }
            alert.addAction(actionCancel)
            alert.addAction(action)
            present(alert, animated: true)
        }
    
    func leftLabel(){
        let limit = self.realm.objects(Limit.self)
        guard limit.isEmpty == false else { return } //чтобы при первом запуске не вылетало, т.к. используем  [0]/ и пробуем настроить этот чертов гит!!!
        limitValueLabel.text = limit[0].limitSum
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let ferstDay = limit[0].limitDay
        let lastDay = limit[0].limitLastDay
        let ferstComponents = calendar.dateComponents([.year, .month, .day], from: ferstDay)
        let lastComponents = calendar.dateComponents([.year, .month, .day], from: lastDay)
        let startDate = formatter.date(from: "\(ferstComponents.year!)/\(ferstComponents.month!)/\(ferstComponents.day!) 00:00")
        let endDate = formatter.date(from: "\(lastComponents.year!)/\(lastComponents.month!)/\(lastComponents.day!) 23:59")

        let filtredLimit: Int = realm.objects(Spending.self).filter("self.date >=%@ && self.date <= %@", startDate, endDate).sum(ofProperty: "cost") // выбираем предикат, то есть по каким условиям будем выбирать
        wastesValueLabel.text = "\(filtredLimit)"
        
        let a = Int(limitValueLabel.text ?? "0") ?? 0
        let b = Int(wastesValueLabel.text ?? "0") ?? 0
        let c = a - b
        
        availableValueLabel.text = "\(c)"
      
    }
    
    func allSpendinf(){
        let allSpend: Int = realm.objects(Spending.self).sum(ofProperty: "cost") //подсчет всех расходов
        expensesValueLabel.text = "\(allSpend)"
    }
}

    
    extension ExpensesViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return spandingArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FinanceCell", for: indexPath) as? FinanceCell else {fatalError()}
            let spending = spandingArray.sorted(byKeyPath: "date",ascending:false)[indexPath.row]
            cell.categoryName.text = spending.category
            cell.sumName.text = String(spending.cost)
            switch spending.category{
            case "Еда": cell.categoryImage.image = UIImage(named: "eat")
            case "Кальян": cell.categoryImage.image = UIImage(named: "hookah")
            case "Уход": cell.categoryImage.image = UIImage(named: "barber")
            case "Авто": cell.categoryImage.image = UIImage(named: "car")
            case "ЖКУ": cell.categoryImage.image = UIImage(named: "gku")
            case "Досуг": cell.categoryImage.image = UIImage(named: "dosug")
            default: break
            }
            return cell
        }
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let delete = delereActions(at: indexPath)
            return UISwipeActionsConfiguration(actions: [delete])
        }
        func delereActions(at indexPath: IndexPath) -> UIContextualAction {
            let editingRow = spandingArray.sorted(byKeyPath: "date",ascending:false)[indexPath.row]
            let array = spandingArray
            let delete = UIContextualAction(style: .destructive, title: "Удалить") { delete, view, completion in
                try! self.realm.write {
                    self.realm.delete(editingRow)
                }
                self.leftLabel()
                self.allSpendinf()
                self.tableView.deleteRows(at: [indexPath] , with: .automatic)
                completion(true)
            }
            return delete
        }
    }
