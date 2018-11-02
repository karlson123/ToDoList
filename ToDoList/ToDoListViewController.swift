//
//  ViewController.swift
//  ToDoList
//
//  Created by Dima Pi on 29/10/2018.
//  Copyright © 2018 Dima Pi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogrgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//start count how many items in itemArray, and output this number from this function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
//end  count how many items in itemArray, and output this number from this function

//start display all items from itemArray into table that was created in func above
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
//end  display all items from itemArray into table that was created in func above

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print (itemArray[indexPath.row])


        //check if row has checkmark than add or remove it
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

    
    
    
    
    
        tableView.deselectRow(at: indexPath, animated: true)  //make selecet row more nice visual
    }
  
    
   /*swipe right
    override func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("OK, marked as Closed")
            success(true)
        })
        closeAction.image = UIImage(named: "tick")
        closeAction.backgroundColor = .purple
        
        return UISwipeActionsConfiguration(actions: [closeAction])
        
    }
    */
    
    /* swipe left
    override func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let modifyAction = UIContextualAction(style: .normal, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            success(true)
        })
        modifyAction.image = UIImage(named: "hammer")
        modifyAction.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    */
    
    
}










