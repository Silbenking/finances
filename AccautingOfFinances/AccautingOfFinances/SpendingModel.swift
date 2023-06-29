 //
//  SpendingModel.swift
//  AccautingOfFinances
//
//  Created by Сергей Сырбу on 22.06.2023.
//

import RealmSwift

class Spending: Object {
    @Persisted var category = ""
    @Persisted var cost = 1
    @Persisted var date = Date()
}

class Limit: Object {
    @Persisted var limitSum = ""
    @Persisted var limitDay = Date()
    @Persisted var limitLastDay = Date()
}
