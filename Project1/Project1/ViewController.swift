//
//  ViewController.swift
//  Project1
//
//  Created by Anna Han on 10/26/20.
//

import UIKit

// For table view

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray:Array<Dictionary<String, Any>>? //For Json array ?:optional-> can be empty
   
    //MARK: - tableView variable
    @IBOutlet weak var tableView: UITableView!
    
    //1. http - urlsession
    //2. JSON from news api https://newapi.org
    
    func getNews() {
        // URLSession class and related classes provide an API for downloading data from and uploading data to endpoints indicated by URLs
        //url from Top headlines in the US
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6bb488151a424db58934542e43886a1f")!) { (data, response, error) in
            //optional binding
            if let dataJson = data {
               // print(dataJson)
                //Json parsing
                do { // when try, error catch
                    //JSONSerialization:convert JSON to Foundation objects and convert Foundation objects to JSON.
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    //json is Dictionary in swift <Key , Value>
                   // print(json)
                    
                   let articles = json["articles"] as! Array<Dictionary<String, Any>>
                   // print(articles)
//                    for (idx, value) in articles.enumerated(){
//                        if let v = value as? Dictionary<String, Any> {
//                            print("\(v["title"])")
//                            print("\(v["description"])")
//                        }
//                    }
                    self.dataArray = articles
                    //!everything working under background, now show in Main
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }catch{
                }
            }
        }
        //if it is suspended, resume
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return dataArray!.count
        if let news = dataArray{
            return news.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier:"Prototype", for: indexPath) as! Prototype //as: check parent-child
        let index = indexPath.row
        
        if let news = dataArray{
            
            let row = news[index]
            print("row : \(row)")
            
            if let rows = row as? Dictionary<String, Any>{
                print("title : \(rows)")
                //show text at tableView
                if let title = rows["title"]{
                    cell.textLabel?.text = title as? String
                }
            }
        }
       // cell.textLabel?.text = dataArray[indexPath.row]
        
        print(indexPath.row)
        return cell
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        getNews()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click  \(indexPath.row)")
        
        //pull from storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
       
        if let news = dataArray{

            let row = news[indexPath.row]
            print("row : \(row)")
            if let rows = row as? Dictionary<String, Any>{

                if let imageUrl = rows["urlToImage"] as? String{
                    controller.imageUrl = imageUrl
                }
                if let desc = rows["description"] as? String {
                    controller.desc = desc
                }
            }
        }
        showDetailViewController(controller, sender: nil)
        
        //tableView.deselectRow(at: indexPath, animated: false)
//        if( indexPath.row % 1 == 0){
//            var  detailsViewController = storyboard?.instantiateViewController(identifier: "DetailsViewController")
//            present(detailsViewController!, animated: true, completion: nil)
//        }
//        else{
//           // tableView.cellForRow(at: indexPath)?.accessoryType = .none
//            return
//        }
            }
    
    //segue: parent(UIViewController) - child
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "Detail" == id {
            
            //if let controller = segue.destination as? DetailsViewController
            if let controller = segue.destination as? DetailsViewController
            {
                
                
                if let news = dataArray{
                    
                    if let indexPath = tableView.indexPathForSelectedRow{
                        let row = news[indexPath.row]
                        print("row : \(row)")
                        if let rows = row as? Dictionary<String, Any>{
                            
                           
                            if let imageUrl = rows["urlToImage"] as? String{
                                controller.imageUrl = "urlToImage"
                            }
                            if let desc = rows["description"] as? String {
                                controller.desc = "description"
                            }
                       }
                    }
                }
            }
        }
    }



    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if( indexPath.row % 2 == 0){
            return 100
        }
        else{
            return 100
        }

    }
}

