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
    
    private var data = [1, 2, 3]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = {
            class DataSource: NSObject, UITableViewDataSource {
                
                var data: [Int] = []
                
                init(data: [Int]) {
                    self.data = data
                }
                
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return data.count
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                    cell.textLabel?.text = "\(data[indexPath.row])"
                    return cell
                }
                
                deinit {
                    debug {
                        print("No retain cycle 👍 \(self)")
                    }
                }
            }
            
            return attaching(DataSource(data: data), to: self)
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

