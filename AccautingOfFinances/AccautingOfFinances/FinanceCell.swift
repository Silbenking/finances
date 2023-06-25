//
//  FinanceCell.swift
//  AccautingOfFinances
//
//  Created by Сергей Сырбу on 16.06.2023.
//

import UIKit

class FinanceCell: UITableViewCell {

    let categoryImage = UIImageView()
    
    let categoryName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let sumName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        contentView.backgroundColor = .black
        contentView.addSubview(categoryImage)
        categoryImage.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        }
        contentView.addSubview(categoryName)
        categoryName.snp.makeConstraints { make in
            make.leading.equalTo(categoryImage.snp.trailing).offset(10)
            make.centerY.equalTo(categoryImage)
//            make.bottom.equalToSuperview().inset(20)
        }
        contentView.addSubview(sumName)
        sumName.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.centerY.equalTo(categoryImage)
//            make.bottom.equalToSuperview().inset(20)
        }
    }
    
}
