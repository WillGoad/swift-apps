//
//  CommentGeneratorTests.swift
//  CommentCardWriterTests
//
//  Created by Goad, William (PAH) on 25/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import XCTest
@testable import CommentCardWriter

class CommentGeneratorTests: XCTestCase {

    func testGenerateWithAllParametersSetReturnComment() {
        //arrange
        let expected = Comment(content: "I am currently loving Physics. I find the pace of lessons at the moment to be too slow for me. At this point I would say my greatest strength in class is writing and my main weakness is talking. Thankyou very much!")
        
        //act
        let actual = CommentGenerator.generate(subject: "Physics", levelOfEnjoyment: 3, paceSatisfaction: 1, weakness: "talking", strength: "writing", additionalComments: "Thankyou very much!")
        //assert
        XCTAssertEqual(actual.content, expected.content)
    }

}
