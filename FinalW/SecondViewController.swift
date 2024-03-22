//
//  SecondViewController.swift
//  FinalW
//
//  Created by Никита Попов on 22.03.24.
//

import UIKit

class SecondViewController: UIViewController {
    let table = UITableView()
    let staticLabel = UILabel()
    let netwManager = NetwManager()
    var data: DataModel?
    
    override func loadView() {
        super.loadView()
        netwManager.fetchData(type: .toAirport) { res in
            switch res{
                
            case .success(let data):
                self.data = data
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            case .failure(_):
                print("error")
            }
        }
        
        netwManager.getLabelData{res in
            switch res{
                
            case .success(let dataL):
                DispatchQueue.main.async{
                    self.staticLabel.text = dataL.copyright.text + " " + dataL.copyright.url
                }
            case .failure(_):
                print("error")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Прилет"
        view.backgroundColor = .white
        createTable()
        createLabel()
    }
    
    private func createTable(){
        table.frame = view.bounds
        table.register(CellPrototype.self, forCellReuseIdentifier: "cellPrototype2")
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
    }
    
    private func createLabel(){
        view.addSubview(staticLabel)
        staticLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            staticLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            staticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            staticLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            staticLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        staticLabel.backgroundColor = .yellow
        staticLabel.numberOfLines = 3
    }

}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.schedule.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPrototype2", for: indexPath) as? CellPrototype else { return UITableViewCell()}
        
        guard let currentDataItem = data?.schedule[indexPath.row] else {return UITableViewCell()}
        cell.contentGenerate(number: currentDataItem.thread.number, time: currentDataItem.arrival ?? "", name: currentDataItem.thread.shortTitle, transport: currentDataItem.thread.vehicle)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Возвращаем желаемую высоту для каждой ячейки
        return 100
    }
    
    
}
