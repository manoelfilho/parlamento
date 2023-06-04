import XCTest
import Infra

final class URLSessionAdapterTests: XCTestCase {

    var sut: URLSessionAdapter!
    var expectation: XCTestExpectation!

    override func setUp() {
        
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)

        sut = URLSessionAdapter(urlSession: urlSession)
        expectation = expectation(description: "Expectation")
        
    }
    
    func testURLSessionAdapter_FinishWithSuccess_WhenURLProtocolReturnCorrectData(){
        
        let data = makeValidData()
        let apiUrl = makeUrl()
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: apiUrl, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        sut.get(to: apiUrl) { result in
            
            switch result {
                case .success(let success):
                    XCTAssertEqual(data, success)
                case .failure(let error):
                    XCTFail("Error was not expected: \(error)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testURLSessionAdapter_FinishFinishWithFailure_WhenURLProtocolReturnError(){
        
        let data = makeInvalidData()
        let apiUrl = makeUrl()
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: apiUrl, statusCode: 500, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        sut.get(to: apiUrl) { result in
            
            switch result {
                case .success(_):
                    XCTFail("Error was expected and data was received")
                case .failure(let error):
                    XCTAssertNotNil(error)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        
    }

}
