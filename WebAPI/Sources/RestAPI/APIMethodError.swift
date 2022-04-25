public enum APIMethodError: Error {
    case transport(Error)
    case decoding(Error)
}
