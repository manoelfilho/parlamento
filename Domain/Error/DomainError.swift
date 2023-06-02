import Foundation

public enum DomainError: Error {
    case unexpected
    case badRequest
    case unauthorized
    case apiError
    case forbiden
    case serverError
}
