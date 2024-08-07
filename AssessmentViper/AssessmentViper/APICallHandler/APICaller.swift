//
//  APICaller.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation


protocol APICaller {
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void)
}

protocol LocalDataManage {
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void)
    func saveUniversities(_ universities: [University])
}
