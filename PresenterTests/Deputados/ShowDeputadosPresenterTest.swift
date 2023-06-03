import XCTest
@testable import Presenter
import Domain
import DataTests

final class ShowDeputadosPresenterTest: XCTestCase {

    func testGetDeputados_WhenServiceReturnsSuccess_ShouldCallShowDeputadosAndToggleLoading() {
        // Arrange
        let exp = expectation(description: "waiting")
        let deputados: [Deputado] = []
        
        // Act
        let (_, getDeputadosSpy, showDeputadosStub) = makeSut()
        
        getDeputadosSpy.getDeputados { result in
            switch result {
                case .success(let deputados):
                    showDeputadosStub.showDeputados(with: deputados)
                    showDeputadosStub.toggleLoading()
                case .failure(_):
                    XCTFail("Expected [Deputados] and erro received")
            }
            exp.fulfill()
        }

        getDeputadosSpy.completeWithDeputados(deputados)
        
        // Assert
        XCTAssertTrue(showDeputadosStub.showDeputadosCalled)
        XCTAssertTrue(showDeputadosStub.toggleLoadingCalled)
        
        wait(for: [exp], timeout: 1)
    }
    
    func testGetDeputados_WhenServiceReturnsFailure_ShouldCallShowErrorAndToggleLoading() {
        // Arrange
        let exp = expectation(description: "waiting")
        let deputados: [Deputado] = []
        
        // Act
        let (_, getDeputadosSpy, showDeputadosStub) = makeSut()
        
        getDeputadosSpy.getDeputados { result in
            switch result {
                case .success(_):
                    XCTFail("Expected error and data received")
                case .failure(_):
                    showDeputadosStub.showDeputados(with: deputados)
                    showDeputadosStub.toggleLoading()
            }
            exp.fulfill()
        }

        getDeputadosSpy.completeWithDomainError(.unexpected)
        
        // Assert
        XCTAssertTrue(showDeputadosStub.showDeputadosCalled)
        XCTAssertTrue(showDeputadosStub.toggleLoadingCalled)
        
        wait(for: [exp], timeout: 1)
    }

}

extension ShowDeputadosPresenterTest {
    
    func makeSut() -> (sut: ShowDeputadosPresenter, getDeputadosSpy: GetDeputadosSpy, showDeputadosStub: ShowDeputadosStub) {
        let getDeputadosSpy = GetDeputadosSpy()
        let showDeputadosStub = ShowDeputadosStub()
        
        let sut = ShowDeputadosPresenter(getDeputadosService: getDeputadosSpy)
        sut.setViewDelegte(deputadosProtocol: showDeputadosStub)
        
        return (sut, getDeputadosSpy, showDeputadosStub)
    }
    
}

class GetDeputadosSpy: GetDeputadosProtocol {
    
    var completion: ((Result<[Deputado], DomainError>) -> Void)?

    func getDeputados(completion: @escaping (Result<[Deputado], DomainError>) -> Void) {
        self.completion = completion
    }
    
    public func completeWithDeputados( _ deputados: [Deputado]){
        completion?(.success(deputados))
    }
    
    public func completeWithDomainError(_ domainError: DomainError){
        completion?(.failure(domainError))
    }
    
}

class ShowDeputadosStub: ShowDeputadosProtocol {
    
    var showDeputadosCalled = false
    var showErrorCalled = false
    var toggleLoadingCalled = false
    
    func showDeputados(with deputados: [Deputado]) {
        showDeputadosCalled = true
    }
    
    func showErrorGettingDeputados(message: String) {
        showErrorCalled = true
    }
    
    func toggleLoading() {
        toggleLoadingCalled = true
    }
    
}



