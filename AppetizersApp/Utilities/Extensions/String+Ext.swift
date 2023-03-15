//
//  String+Ext.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/4/23.
//

import Foundation
import RegexBuilder

extension String {
    
    // Regex Builder is a lot more code, but it's arguably easier to understand.
    var isValidEmail: Bool {
        let emailFormat = Regex {
            // First, one or more of these characters:
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            // Next, an @ symbol.
            "@"
            // Next, one or more of these characters:
            OneOrMore {
                CharacterClass(
                    .anyOf(".-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            // Next, a dot.
            "."
            // Next, 2-64 of the following characters:
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
        }
        
        // wholeMatch(of:) returns a regex optional.
        // If there's a match, wholeMatch(of:) will return it. If no match, it will return nil.
        // If not nil, isValidEmail returns true. If nil, isValidEmail returns false.
        return self.wholeMatch(of: emailFormat) != nil
    }
    
}
