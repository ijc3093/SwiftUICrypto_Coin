//
//  PortfolioDataService.swift
//  SwiftUICrypto
//
//  Created by Ike Chukz on 5/29/23.
//

import Foundation
import CoreData

class PortfolioDataService_DB {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer_DB" // This is from DB name in CoreData
    private let entitName: String = "PortfolioEntity" // This is from Table name in CoreData
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init(){
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores{ (_, error) in
            if let error = error{
                print("Error loading Core Data! \(error)")
            }
            self.getPortfolio()
        }
    }
    
    // MARK: PUBLIC
    func updatePortfolio(coin: CoinModel, amount: Double){
        
        // check if coin is already in portfolio
        if let entity = savedEntities.first(where: {$0.coinID == coin.id }){
            
            if amount > 0 {
                update(entity: entity, amount: amount)
            }else {
                delete(entity: entity)
            }
        }else{
            add(coin: coin, amount: amount)
        }
        
    }
    
    
    // MARK: PRIVATE
    
    // Get All Data
    private func getPortfolio(){
        let request = NSFetchRequest<PortfolioEntity>(entityName: entitName)
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error {
            print("Error fetching Portfolio Entities. \(error)")
        }
    }
    
    //Add
    private func add(coin: CoinModel, amount: Double){
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    //Update
    private func update(entity: PortfolioEntity, amount: Double){
        entity.amount = amount
        applyChanges()
    }
    
    //Delete
    private func delete(entity: PortfolioEntity){
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    //Save
    private func save(){
        do{
            try container.viewContext.save()
        }catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    //Apply Changes
    private func applyChanges(){
        save()
        getPortfolio()
    }
}
