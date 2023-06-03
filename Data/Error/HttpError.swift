import Foundation

public enum HttpError: Error {
    case unexpected
    case unauthorized
    case serverError
    case networkError
    case emptyResponse
}
