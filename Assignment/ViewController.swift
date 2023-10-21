//
//  ViewController.swift
//  Assignment
//
//  Created by user235324 on 10/13/23.
//

import UIKit

class ViewController: UITableViewController {
    
    let contex = (UIApplication.shared.delegate as! AppDelegate)
    
    var items : [String] = ["Task "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
//        cell.textLabel?.text = "Hello World!"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let deleteDialog = UIAlertController(title: "Warning", message: "Do you want to delete this?", preferredStyle: .alert)
            
            deleteDialog.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) -> Void in
                tableView.beginUpdates()
                
                self.items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .none)
                tableView.endUpdates()
            }))
            
            deleteDialog.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(deleteDialog, animated: true)

            
        }
    }
    
    @IBAction
    func addAlertDialog() {
        
        let addAlertDialog = UIAlertController(title: "Add Todo", message: "Enter new Todo", preferredStyle: .alert)
        
        addAlertDialog.addTextField { textField in
            textField.placeholder = "New Task"
        }
        
        addAlertDialog.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            if let field = addAlertDialog.textFields?.first {
                if let input = field.text, !input.isEmpty  {
                    DispatchQueue.main.async {
                        self.items.append(input)
                        self.tableView.reloadData()
                    }
                }
            }
        } ))
        
        addAlertDialog.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(addAlertDialog, animated: true)
        
    }
    
    
    
    func getAllItems() {
        do{
            let items = try context.fetchRequest(ToDoListItem.fetchRequest())
        } catch {
            
        }
        
    }
    
}

