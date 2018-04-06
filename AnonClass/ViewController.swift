//
//  ViewController.swift
//  AnonClass
//
//  Created by admin on 4/6/18.
//  Copyright © 2018 Ahmed Khalaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = {
            class DataSource: NSObject, UITableViewDataSource {
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return 10
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                    cell.textLabel?.text = "\(indexPath)"
                    return cell
                }
                
                deinit {
                    debug {
                        print("deinit \(self)")
                    }
                }
            }
            
            return attaching(DataSource(), to: self)
        }()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

