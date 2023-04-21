//
//  ListTableViewController.swift
//  ScanApp
//
//  Created by 近江伸一 on 2023/04/19.
//

import UIKit
//import RealmSwift

class ListTableViewController: UITableViewController {
//    let realm = try! Realm()
//    var data: Results<Artical>!
//    public var item: ItemList?
   // var lists = List<Artical>()
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
  //      data = realm.objects(Artical.self)
        table.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        configureRefreshControl()
        //configulation()
       table.reloadData()
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    //    detailViewController.str = data[indexPath.row].name
        self.present(detailViewController, animated: true, completion: nil)
    
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return data.count
//    }
    //くるくる回ってリロード処理
    func configureRefreshControl () {
        table.refreshControl = UIRefreshControl()
        table.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    @objc func handleRefreshControl() {
        DispatchQueue.main.async {
            self.table.reloadData()  //リロード処理
            self.table.refreshControl?.endRefreshing()
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
    //    let artical = data[indexPath.row]
    //    cell.inTextLabel.text = artical.name
     //   print(artical.name)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 //       data = realm.objects(Artical.self)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
     //       Helper().deleteItem(item: data[indexPath.row])
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        table.reloadData()
    }
    
}

