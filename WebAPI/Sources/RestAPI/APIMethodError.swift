/// An API method execution error.
public enum APIMethodError: Error {

    /// A `URLSession` related error
    case transport(Error)

    /// `JSONDecoder` related error
    case decoding(Error)

}
