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
        let message = "error getting deputados"
        
        // Act
        let (_, getDeputadosSpy, showDeputadosStub) = makeSut()
        
        getDeputadosSpy.getDeputados { result in
            switch result {
                case .success(_):
                    XCTFail("Expected error and data received")
                case .failure(_):
                    showDeputadosStub.showErrorGettingDeputados(with: message)
                    showDeputadosStub.toggleLoading()
            }
            exp.fulfill()
        }

        getDeputadosSpy.completeWithDomainError(.unexpected)
        
        // Assert
        XCTAssertTrue(showDeputadosStub.showErrorCalled)
        XCTAssertTrue(showDeputadosStub.toggleLoadingCalled)
        
        wait(for: [exp], timeout: 1)
    }

    func testGetDeputados_WhenServiceReturnsSucces_ShouldCallShowDeputadosProtocol_WithCorrectValues() {
        // Arrange
        let exp = expectation(description: "waiting")
        let deputados: [Deputado] = makeCollectionDeputados()
        
        // Act
        let (sut, getDeputadosSpy, showDeputadosStub) = makeSut()
        sut.getDeputados()
        
        getDeputadosSpy.completeWithDeputados(deputados)
        exp.fulfill()
        
        // Assert
        XCTAssertEqual(showDeputadosStub.deputados, deputados)
        wait(for: [exp], timeout: 1)
    }
    
    func testGetDeputados_WhenServiceReturnsFailure_ShouldCallShowError_WithCorrectMessage() {
        // Arrange
        let exp = expectation(description: "waiting")
        let message = "Erro no retorno dos dados"
        
        // Act
        let (sut, getDeputadosSpy, showDeputadosStub) = makeSut()
        sut.getDeputados()
        
        getDeputadosSpy.completeWithDomainError(.unexpected)
        exp.fulfill()
        
        // Assert
        XCTAssertEqual(showDeputadosStub.messageError, message)
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
    
    var deputados: [Deputado] = []
    var messageError: String = ""
    
    func showDeputados(with deputados: [Deputado]) {
        self.deputados = deputados
        showDeputadosCalled = true
    }
    
    func showErrorGettingDeputados(with message: String) {
        self.messageError = message
        showErrorCalled = true
    }
    
    func toggleLoading() {
        toggleLoadingCalled = true
    }
    
}



