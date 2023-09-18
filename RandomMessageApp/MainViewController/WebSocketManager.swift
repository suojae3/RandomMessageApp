//import Starscream
//
//class WebSocketManager: WebSocketDelegate {
//    func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {
//        <#code#>
//    }
//    
//        
//
//    private var socket: WebSocket!
//    var delegate: WebSocketManagerDelegate?
//
//    init(url: URL) {
//        socket = WebSocket(request: URLRequest(url: url))
//        socket.delegate = self
//    }
//
//    func connect() {
//        socket.connect()
//    }
//
//    func disconnect() {
//        socket.disconnect()
//    }
//
//    func send(message: String) {
//        socket.write(string: message)
//    }
//
//    // MARK: - WebSocketDelegate methods
//    func didReceive(event: WebSocketEvent, client: WebSocket) {
//        // Handle WebSocket events, and maybe forward relevant ones to your custom delegate
//    }
//}
//
//protocol WebSocketManagerDelegate: AnyObject {
//    func didReceiveMessage(_ manager: WebSocketManager, message: String)
//    // ... other delegate methods as needed
//}
