//
//  CatagoryViewController.swift
//  Todoey
//
//  Created by Magnus Eri Wærstad on 13.02.2018.
//  Copyright © 2018 Magnus Eri Wærstad. All rights reserved.
//

import UIKit
import CoreData

class CatagoryViewController: UITableViewController {
    
    var catagoryArray = [Catagory]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCatagory()
        
    }

    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatagoryCell", for: indexPath)
        
        cell.textLabel?.text = catagoryArray[indexPath.row].name
        
        return cell
        
    }
    
    //MARK: -TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = catagoryArray[indexPath.row]
        }
    }
    
    
    //MARK: - Data Manipulations Methods
    
    func saveCatagory() {
        
        
        do {
            try context.save()
        } catch {
            print("Error saving category \(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
    func loadCatagory(with request: NSFetchRequest<Catagory> = Catagory.fetchRequest()) {
        
        do {
            catagoryArray = try context.fetch(request)
        } catch {
            print("Error loading categories \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    
    //MARK: - Add New Category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Catagory(context: self.context)
            newCategory.name = textField.text
            self.catagoryArray.append(newCategory)
            
            self.saveCatagory()
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            textField = alertTextField
            alertTextField.placeholder = "Create new category"
        }

        present(alert, animated: true, completion: nil)
        
        
    }
    

    


   

    
}

