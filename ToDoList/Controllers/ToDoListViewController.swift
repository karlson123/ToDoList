//
//  ViewController.swift
//  ToDoList
//
//  Created by Dima Pi on 29/10/2018.
//  Copyright © 2018 Dima Pi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print(dataFilePath)
        
    
        
       
loadItems()
  	
    
    }
//start count how many items in itemArray, and output this number from this function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
//end  count how many items in itemArray, and output this number from this function

//start display all items from itemArray into table that was created in func above
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        
        //value = condition ? value if true : value if false
        //cell.accessoryType = item.done == true ? .checkmark : .none
        //or more shorter
        cell.accessoryType = item.done ? .checkmark : .none
//        //line above is same as the if below
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        return cell
    }
//end  display all items from itemArray into table that was created in func above

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//! mean oposite, if left side not equal to right side true or false
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
     
        
        saveItems()

        tableView.deselectRow(at: indexPath, animated: true)  //make selecet row more nice visual
    }
  
    
  


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New To Do Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when user clik the add item button
         
            let newItem = Item()
            newItem.title = textField.text!
                self.itemArray.append(newItem) //add new item to itemArray
            
          self.saveItems()
      
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New Item"   //gray text inside text field and it will dissapear afetr you input text
            print(alertTextField.text!)
            textField = alertTextField
            
            
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
           }
    


    func saveItems() {
    let encoder = PropertyListEncoder()
    
    do {
    let data = try encoder.encode(itemArray)
    try data.write(to: dataFilePath!)
    } catch {
    print("error encoding itemarray \(error)")
    }
    self.tableView.reloadData() //reload table with new item
}

    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
             itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("error of decode data \(error)")
                
            }

        }
    }



}


/* check if item already in the list and pop up of added item
 if self.itemArray.contains(textField.text!) == true{
 print("already contain")
 let alert = UIAlertController(title: "", message: "\(textField.text!) - added", preferredStyle: .alert)
 alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
 self.present(alert, animated: true, completion: nil)
 } */

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
