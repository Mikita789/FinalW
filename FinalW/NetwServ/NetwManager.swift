//
//  NetwManager.swift
//  FinalW
//
//  Created by Никита Попов on 22.03.24.
//

import Foundation

class NetwManager{
    func fetchData(type: URLsConst, esc: @escaping (Result<DataModel, Error>)->(Void)) {
        guard let url = type.urlRes else {
            print("DEBUG: - Bad url")
            esc(.failure(NetwUserError.badUrl))
            return
        }
        
        let _ = URLSession.shared.dataTask(with: url) { data, resp, err in
            if err != nil {
                print("DEBUG: - data err")
                esc(.failure(NetwUserError.noData))
                return
            }
            guard let data = data else {
                print("DEBUG:- No data")
                esc(.failure(NetwUserError.noData))
                return
            }
            guard let res = self.parseData(data: data, to: DataModel.self) else {
                print("DEBUG: - parse error")
                esc(.failure(NetwUserError.parseErr))
                return
            }
            esc(.success(res))
    
        }.resume()
        
        
    }
    
    func getLabelData(esc: @escaping (Result<LabelInfo, Error>)->(Void)){
        guard let url = URLsConst.copyright.urlRes else {
            print("DEBUG: - Bad url")
            esc(.failure(NetwUserError.badUrl))
            return
        }
        let _ = URLSession.shared.dataTask(with: url) { data, resp, err in
            if err != nil {
                print("DEBUG: - data err")
                esc(.failure(NetwUserError.noData))
                return
            }
            guard let data = data else {
                print("DEBUG:- No data")
                esc(.failure(NetwUserError.noData))
                return
            }
            guard let res = self.parseData(data: data, to: LabelInfo.self) else {
                print("DEBUG: - parse error")
                esc(.failure(NetwUserError.parseErr))
                return
            }
            esc(.success(res))
    
        }.resume()
    }
    
    
    
    private func parseData<T: Codable>(data: Data, to type: T.Type) -> T?{
        let decoder = JSONDecoder()
        do{
            let res = try decoder.decode(T.self, from: data)
            return res
        }catch{
            print("DEBUG: - Error data parse")
            return nil
        }
    }
    
}

enum NetwUserError: Error{
    case badUrl
    case parseErr
    case noData
}
