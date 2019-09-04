//
//  SBAAction.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/24/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

enum SBAType : Int{
    case action
    case info
}
protocol SBAActionType {
    func type() -> SBAType
}

public class SBAAction: SBAUiSettings, SBAActionType {
    func type() -> SBAType {
        return .action
    }
}

