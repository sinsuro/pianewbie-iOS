//
//  API.swift
//  Pianewbie
//
//  Created by 한태희 on 2022/04/26.
//

import Foundation
import Alamofire

struct Notes : Codable {
    let noteNames : String?
    let isNote : Bool? //True: Note , False: Rest
    let accidental : String?
    let size : Int? //1/2/4/8/16/32/64
    let isDotted : Bool?
    let x : Float?
    let y : Float?
    let pitch : [Int?]  //C is 0, if reset -> []
}
struct Measure : Codable {
    let accidental : String?
    let changingMeter : String?
    let noteCount : Int?
    let measureMinX : Float?
    let measureMinY : Float?
    let measureMaxX : Float?
    let measureMaxY : Float?
    let notes : [Notes?]
}
struct MusicInfo : Codable {
    let musicTitle : String?
    let musicArtist : String?
    let timeSignature : String? // 4/4 3/4 6/8 ..
    let keySignature : String?
    let tempo : Int?
    let measureCount : Int?
}
struct SheetData : Codable {
    let info : MusicInfo?
    let measures : [Measure?]
}
struct SheetStruct : Codable {
    let status : Int?
    let success : Bool?
    let message : String?
    let data : SheetData?
}

let tmpNote = Notes(noteNames: "C4", isNote: true, accidental: "", size: 1, isDotted: false, x: 0.0, y: 0.0, pitch: [])
let do_ = Notes(noteNames: "C4", isNote: true, accidental: "", size: 2, isDotted: false, x: 0.0, y: 0.0, pitch: [0])
let rest_ = Notes(noteNames: "", isNote: false, accidental: "", size: 2, isDotted: false, x: 5.0, y: 0.0, pitch: [])
let tmpMeasure = Measure(accidental: "", changingMeter: "", noteCount: 4, measureMinX: 0.0, measureMinY: 0.0, measureMaxX: 0.0, measureMaxY: 0.0, notes: [do_, rest_])
let tmpMeasure2 = Measure(accidental: "", changingMeter: "", noteCount: 4, measureMinX: 0.0, measureMinY: 0.0, measureMaxX: 0.0, measureMaxY: 0.0, notes: [do_, rest_])
let tmpInfo = MusicInfo(musicTitle: "music name", musicArtist: "artist", timeSignature: "4/4", keySignature: "###", tempo: 120, measureCount: 4)
let tmpSheet = SheetData(info: tmpInfo, measures: [tmpMeasure,tmpMeasure,tmpMeasure,tmpMeasure])

func API_loadMusic(completion: @escaping (Bool, SheetData) -> ()) {
    
    completion(true, tmpSheet)
    
//    let url = "http://13.125.88.202:8080/home"
//    var request = URLRequest(url: URL(string: url)!)
//    let token = UserDefaults.standard.string(forKey: "userToken")!
////    let headers: HTTPHeaders = [.authorization(bearerToken: token)]
//    request.httpMethod = "GET"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
//    request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
//    request.timeoutInterval = 10
//
//    // POST 로 보낼 정보
////    let params = ["phoneNum" : phoneNum] as Dictionary
//
//    // httpBody 에 parameters 추가
////    do {
////        try request.httpBody = JSONSerialization.data(withJSONObject: [], options: [])
////    } catch {
////        print("http Body Error")
////    }
////    var tmpPost = PostData(name: "", location: , industry: "", title: "", content: "", likeCount: 0, scrapCount: 0, replyCount: 0, data: "")
//    let tmpHome = HomeData(userName: "", location: "", industry: "", mainNoticeImgUrl: [], notice: "", myLocalPosts: [], myIndustryPosts: [], newPosts: [], likeBoardList: [])
//
//
//    AF.request(request).responseString { (response) in
//        switch response.result {
//        case .success(let res):
//            do{
//                print("GET 성공")
//                print(" res : \(res)")
//                let jsonData = Data(res.utf8)
//                print("111111111111\(jsonData)")
//                let json = try JSONDecoder().decode(HomeStruct.self, from: jsonData)
////                    print("print : \(json.status)")
////                completion(json.data!.randomNum!)
////                print("\(json.data?.content)")
//                guard let home: HomeData = json.data else {
//                    print("error")
//                    completion(false, tmpHome)
//                    return
//                }
//                print("222222222222\(home)")
////                tmpPost = json.data!
//                if let isSucess : Bool = json.success {
//                    if isSucess {
//                        completion(true, home)
//                    } else {
//                        completion(false, home)
//                    }
//                } else {
//                    completion(false, tmpHome)
//                }
////                self.txtFieldAnswer.text = json.data?.randomNum
//            } catch(let err) {
//                print(err.localizedDescription)
//                completion(false, tmpHome)
//            }
//        case .failure(let error):
//            print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
//            completion(false, tmpHome)
//        }
//
//    }
}
