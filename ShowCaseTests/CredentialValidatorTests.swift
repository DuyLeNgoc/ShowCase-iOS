//
//  CredentialValidatorTests.swift
//  ShowCaseTests
//
//  Created by Duy Le Ngoc on 8/5/19.
//  Copyright © 2019 PYCO. All rights reserved.
//

import Quick
import Nimble

/*
 Feature: Is it a valid email yet?
 
    Everybody wants to know when it's a valid email
 
    Scenario: duy.le isn't a valid email
        Given I input the email "duy.le"
        When I check whether his email is valid or not
        Then I should be received false
 
     Scenario: duy.le@mailinator.com isn't a valid email
        Given I input the email "duy.le@mailinator.com"
        When I check whether his email is valid or not
        Then I should be received false
 
    Scenario: duy.le@pycogroup.com is a valid email
        Given I input the email "duy.le@pycogroup.com"
        When I check whether his email is valid or not
        Then I should be received true
 */

class CredentialValidator {
    static func isValidEmail(email: String) -> Bool {
        let regexEmail = try! NSRegularExpression(pattern: "^[a-z0-9\\._+-]{6,64}@(pycogroup|pyramid-consulting)\\.(com)", options: [])
        return regexEmail.numberOfMatches(in: email, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSRange(location: 0, length: email.count)) > 0
    }
}

class CredentialValidatorTests: QuickSpec {

    override func spec() {
        describe("CredentialValidator") {
            describe("A user") {
                context("input the email wrong format") {
                    it("should be invalid") {
                        let email = "duy.le"
                        expect {CredentialValidator.isValidEmail(email: email)}.to(beFalsy())
                    }
                }

                context("input the email with unsuppoted domain") {
                    it("should be invalid") {
                        let email = "duy.le@mailinator.com"
                        expect {CredentialValidator.isValidEmail(email: email)}.to(beFalsy())
                    }
                }

                context("input the email correctly") {
                    it("should be valid") {
                        let email = "duy.le@pycogroup.com"
                        expect {CredentialValidator.isValidEmail(email: email)}.to(beTruthy())
                    }
                }
            }
        }
    }

}
