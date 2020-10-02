import WalletConnect

class WalletConnectClient {
    let interactor: WalletConnectInteractor
    let peerMeta: WCPeerMeta

    init(interactor: WalletConnectInteractor, peerMeta: WCPeerMeta) {
        self.interactor = interactor
        self.peerMeta = peerMeta
    }

}

extension WalletConnectClient {

    func connect() {
        interactor.connect()
    }

}

extension WalletConnectClient {

    static func storedInstance() -> WalletConnectClient? {
        guard let storeItem = WCSessionStore.allSessions.first?.value else {
            return nil
        }

        let interactor = WalletConnectInteractor(session: storeItem.session)

        return WalletConnectClient(interactor: interactor, peerMeta: storeItem.peerMeta)
    }

}