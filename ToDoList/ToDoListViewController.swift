//
//  ViewController.swift
//  ToDoList
//
//  Created by Dima Pi on 29/10/2018.
//  Copyright © 2018 Dima Pi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogrgon"]
    let defaults = UserDefaults.standard     //user default file - location can see from AppDelegate.swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            
            
        itemArray = items
    }
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
    
    //add new item + sign top right


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New To Do Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when user clik the add item button
         
                self.itemArray.append(textField.text!) //add new item to itemArray
          
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")     //all items from itemarray put into defaults file
            
            print(self.defaults.array(forKey: "ToDoListArray")!)
            
            self.tableView.reloadData() //reload table with new item
            
            
        /* check if item already in the list and pop up of added item
            if self.itemArray.contains(textField.text!) == true{
                print("already contain")
                let alert = UIAlertController(title: "", message: "\(textField.text!) - added", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } */
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New Item"   //gray text inside text field and it will dissapear afetr you input text
            print(alertTextField.text!)
            textField = alertTextField
            
            
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
           }
    






}










