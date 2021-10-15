import InfrastructureKit

public struct Train {
    let surface = TransportSurface.railway
    
    public init() {
        
    }
}

extension Train: CustomStringConvertible {
    public var description: String {
        return "A train uses the \(surface)"
       }
}
