//
//  CellPrototype.swift
//  FinalW
//
//  Created by Никита Попов on 22.03.24.
//

import UIKit

class CellPrototype: UITableViewCell {
    private let numberLabel = UILabel()
    private let timeLabel = UILabel()
    private let nameLabel = UILabel()
    private let transportLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        createLabelName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contentGenerate(number: String, time: String, name: String, transport: String){
        numberLabel.text = number
        timeLabel.text = time
        nameLabel.text = name
        transportLabel.text = transport
    }
    
    private func createLabelName(){
        contentView.addSubview(numberLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(transportLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        transportLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            numberLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
            numberLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            nameLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalTo: numberLabel.widthAnchor),
            nameLabel.heightAnchor.constraint(equalTo: numberLabel.heightAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: numberLabel.leadingAnchor),
            
            transportLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            transportLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            transportLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            transportLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: -5),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        numberLabel.textAlignment = .left
        nameLabel.textAlignment = .left
        transportLabel.textAlignment = .left
        timeLabel.textAlignment = .center
        
//        numberLabel.layer.borderWidth = 1
//        nameLabel.layer.borderWidth = 1
//        transportLabel .layer.borderWidth = 1
//        timeLabel .layer.borderWidth = 1
    }
}
