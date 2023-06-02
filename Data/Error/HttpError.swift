import Foundation

public enum HttpError: Error {
    case unexpected
    case badRequest
    case unauthorized
    case apiError
    case forbiden
    case serverError
}
