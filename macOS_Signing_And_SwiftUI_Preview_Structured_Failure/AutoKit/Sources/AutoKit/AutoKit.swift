import InfrastructureKit

public struct Auto {
    let surface = TransportSurface.roadway
    
    public init() {
        
    }
}

extension Auto: CustomStringConvertible {
    public var description: String {
        return "An auto uses the \(surface)"
       }
}
