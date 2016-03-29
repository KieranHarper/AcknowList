//
//  AcknowListViewControllerTests.swift
//  AcknowExample
//
//  Created by Vincent Tourraine on 22/08/15.
//  Copyright © 2015-2016 VTourraine. All rights reserved.
//

import UIKit
import XCTest

@testable import AcknowList

class AcknowListViewControllerTests: XCTestCase {

    func testConfigureTableView() {
        let bundle = NSBundle(forClass: AcknowParserTests.self)
        let path = bundle.pathForResource("Pods-AcknowExampleTests-acknowledgements", ofType: "plist")
        let viewController = AcknowListViewController(acknowledgementsPlistPath: path)

        XCTAssertEqual(viewController.numberOfSectionsInTableView(viewController.tableView), 1)
        XCTAssertEqual(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0), 1)

        let cell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertEqual(cell.textLabel?.text, "AcknowList")
    }
    
    func testLocalizedStringReturnsDefault() {
        
        class MockAcknowListViewController: AcknowListViewController {
            
            override class func preferredLanguageCode() -> String {
                return "qq-QQ"
            }
        }
        
        XCTAssertEqual("Acknowledgements", MockAcknowListViewController.localizedString(forKey: "VTAckAcknowledgements", defaultString: ""))
        
        XCTAssertEqual("Generated by CocoaPods", MockAcknowListViewController.localizedString(forKey: "VTAckGeneratedByCocoaPods", defaultString: ""))
    }

    
    func testLocalizedStringReturnsEnglish() {
        
        class MockAcknowListViewController: AcknowListViewController {
            
            override class func preferredLanguageCode() -> String {
                return "en-GB"
            }
        }
        
        XCTAssertEqual("Acknowledgements", MockAcknowListViewController.localizedString(forKey: "VTAckAcknowledgements", defaultString: ""))
        
        XCTAssertEqual("Generated by CocoaPods", MockAcknowListViewController.localizedString(forKey: "VTAckGeneratedByCocoaPods", defaultString: ""))
    }
    
    func testLocalizedStringReturnsEnglishUS() {
        
        class MockAcknowListViewController: AcknowListViewController {
            
            override class func preferredLanguageCode() -> String {
                return "en-US"
            }
        }
        
        XCTAssertEqual("Acknowledgements", MockAcknowListViewController.localizedString(forKey: "VTAckAcknowledgements", defaultString: ""))
        
        XCTAssertEqual("Generated by CocoaPods", MockAcknowListViewController.localizedString(forKey: "VTAckGeneratedByCocoaPods", defaultString: ""))
    }
    
    func testLocalizedStringReturnsFrenchForShortLanguageCode() {
        
        class MockAcknowListViewController: AcknowListViewController {
            
            override class func preferredLanguageCode() -> String {
                return "fr"
            }
        }
        
        XCTAssertEqual("Remerciements", MockAcknowListViewController.localizedString(forKey: "VTAckAcknowledgements", defaultString: ""))
        
        XCTAssertEqual("Généré par CocoaPods", MockAcknowListViewController.localizedString(forKey: "VTAckGeneratedByCocoaPods", defaultString: ""))
    }
    
    func testLocalizedStringReturnsFrench() {
        
        class MockAcknowListViewController: AcknowListViewController {
            
            override class func preferredLanguageCode() -> String {
                return "fr-FR"
            }
        }
        
        XCTAssertEqual("Remerciements", MockAcknowListViewController.localizedString(forKey: "VTAckAcknowledgements", defaultString: ""))
        
        XCTAssertEqual("Généré par CocoaPods", MockAcknowListViewController.localizedString(forKey: "VTAckGeneratedByCocoaPods", defaultString: ""))
    }
    
    func testLocalizedStringReturnsSimplifiedChinese() {
        
        class MockAcknowListViewController: AcknowListViewController {
            
            override class func preferredLanguageCode() -> String {
                return "zh-Hans"
            }
        }
        
        XCTAssertEqual("致谢", MockAcknowListViewController.localizedString(forKey: "VTAckAcknowledgements", defaultString: ""))
        
        XCTAssertEqual("使用 CocoaPods 生成", MockAcknowListViewController.localizedString(forKey: "VTAckGeneratedByCocoaPods", defaultString: ""))
    }

}
