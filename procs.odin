package gns


when ODIN_OS == .Windows {
	foreign import lib "lib/win64/GameNetworkingSockets.lib"
} else when ODIN_OS == .Linux {
	foreign import lib "redistributable_bin/linux64/libsteam_api.so"
} else when ODIN_OS == .Darwin {
	foreign import lib "redistributable_bin/osx/libsteam_api.dylib"
}

CALLBACK_PACK_LARGE :: #config(STEAMWORKS_CALLBACK_PACK_LARGE, true)
CALLBACK_ALIGN :: 8 when CALLBACK_PACK_LARGE else 4

FnSteamNetConnectionStatusChanged :: #type proc "c" (_: ^SteamNetConnectionStatusChangedCallback)
FSteamNetworkingSocketsDebugOutput :: #type proc "c" (_: ESteamNetworkingSocketsDebugOutputType, _: cstring)

DatagramErrMsg :: [1024]u8

@(link_prefix = "GameNetworkingSockets_")
foreign lib {
	Init :: proc(pIdentity: ^SteamNetworkingIdentity, errMsg: DatagramErrMsg) -> bool ---
}

@(link_prefix = "SteamAPI_SteamNetworkingSockets_")
foreign lib {
	v009 :: proc() -> ^INetworkingSockets ---
}

@(link_prefix = "SteamAPI_SteamNetworking")
foreign lib {
	Utils_v003 :: proc() -> ^INetworkingUtils ---
}

@(link_prefix = "SteamAPI_ISteam")
foreign lib {
	NetworkingSockets_CreateListenSocketIP :: proc(self: ^INetworkingSockets, localAddress: ^SteamNetworkingIPAddr, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamListenSocket ---
	NetworkingSockets_ConnectByIPAddress :: proc(self: ^INetworkingSockets, address: ^SteamNetworkingIPAddr, nOptions: i32, pOptions: ^SteamNetworkingConfigValue) -> HSteamNetConnection ---
	NetworkingSockets_AcceptConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
	NetworkingSockets_CloseConnection :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nReason: i32, pszDebug: cstring, bEnableLinger: bool) -> bool ---
	NetworkingSockets_CloseListenSocket :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket) -> bool ---
	NetworkingSockets_SetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, nUserData: i64) -> bool ---
	NetworkingSockets_GetConnectionUserData :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection) -> i64 ---
	NetworkingSockets_SetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: cstring) ---
	NetworkingSockets_GetConnectionName :: proc(self: ^INetworkingSockets, hPeer: HSteamNetConnection, pszName: ^u8, nMaxLen: i32) -> bool ---
	NetworkingSockets_SendMessageToConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pData: rawptr, cbData: u32, nSendFlags: i32, pOutMessageNumber: ^i64) -> EResult ---
	NetworkingSockets_FlushMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection) -> EResult ---
	NetworkingSockets_ReceiveMessagesOnConnection :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: i32) -> i32 ---
	NetworkingSockets_GetConnectionInfo :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pInfo: ^SteamNetConnectionInfo) -> bool ---
	NetworkingSockets_GetConnectionRealTimeStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pStatus: ^SteamNetConnectionRealTimeStatus, nLanes: i32, pLanes: ^SteamNetConnectionRealTimeLaneStatus) -> EResult ---
	NetworkingSockets_GetDetailedConnectionStatus :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, pszBuf: ^u8, cbBuf: i32) -> i32 ---
	NetworkingSockets_GetListenSocketAddress :: proc(self: ^INetworkingSockets, hSocket: HSteamListenSocket, address: ^SteamNetworkingIPAddr) -> bool ---
	NetworkingSockets_CreateSocketPair :: proc(self: ^INetworkingSockets, pOutConnection1: ^HSteamNetConnection, pOutConnection2: ^HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: ^SteamNetworkingIdentity, pIdentity2: ^SteamNetworkingIdentity) -> bool ---
	NetworkingSockets_ConfigureConnectionLanes :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, nNumLanes: i32, pLanePriorities: ^int, pLaneWeights: ^u16) -> EResult ---
	NetworkingSockets_GetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) -> bool ---
	NetworkingSockets_CreatePollGroup :: proc(self: ^INetworkingSockets) -> HSteamNetPollGroup ---
	NetworkingSockets_DestroyPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool ---
	NetworkingSockets_SetConnectionPollGroup :: proc(self: ^INetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool ---
	NetworkingSockets_ReceiveMessagesOnPollGroup :: proc(self: ^INetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: ^^SteamNetworkingMessage, nMaxMessages: i32) -> i32 ---
	NetworkingSockets_ResetIdentity :: proc(self: ^INetworkingSockets, pIdentity: ^SteamNetworkingIdentity) ---
	NetworkingSockets_RunCallbacks :: proc(self: ^INetworkingSockets) ---


	Networking_CreateListenSocket :: proc(self: ^INetworking, nVirtualP2PPort: i32, nIP: SteamIPAddress, nPort: u16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket ---
	Networking_CreateConnectionSocket :: proc(self: ^INetworking, nIP: SteamIPAddress, nPort: u16, nTimeoutSec: i32) -> SNetSocket ---
	Networking_DestroySocket :: proc(self: ^INetworking, hSocket: SNetSocket, bNotifyRemoteEnd: bool) -> bool ---
	Networking_DestroyListenSocket :: proc(self: ^INetworking, hSocket: SNetListenSocket, bNotifyRemoteEnd: bool) -> bool ---
	Networking_SendDataOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pubData: rawptr, cubData: u32, bReliable: bool) -> bool ---
	Networking_IsDataAvailableOnSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pcubMsgSize: ^u32) -> bool ---
	Networking_RetrieveDataFromSocket :: proc(self: ^INetworking, hSocket: SNetSocket, pubDest: rawptr, cubDest: u32, pcubMsgSize: ^u32) -> bool ---
	Networking_IsDataAvailable :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pcubMsgSize: ^u32, phSocket: ^SNetSocket) -> bool ---
	Networking_RetrieveData :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pubDest: rawptr, cubDest: u32, pcubMsgSize: ^u32, phSocket: ^SNetSocket) -> bool ---
	Networking_GetSocketInfo :: proc(self: ^INetworking, hSocket: SNetSocket, pSteamIDRemote: ^CSteamID, peSocketStatus: ^int, punIPRemote: ^SteamIPAddress, punPortRemote: ^u16) -> bool ---
	Networking_GetListenSocketInfo :: proc(self: ^INetworking, hListenSocket: SNetListenSocket, pnIP: ^SteamIPAddress, pnPort: ^u16) -> bool ---
	Networking_GetSocketConnectionType :: proc(self: ^INetworking, hSocket: SNetSocket) -> ESNetSocketConnectionType ---
	Networking_GetMaxPacketSize :: proc(self: ^INetworking, hSocket: SNetSocket) -> i32 ---


	NetworkingUtils_SetDebugOutputFunction :: proc(self: ^INetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) ---
	NetworkingUtils_IsFakeIPv4 :: proc(self: ^INetworkingUtils, nIPv4: u32) -> bool ---
	NetworkingUtils_GetIPv4FakeIPType :: proc(self: ^INetworkingUtils, nIPv4: u32) -> ESteamNetworkingFakeIPType ---
	NetworkingUtils_GetRealIdentityForFakeIP :: proc(self: ^INetworkingUtils, fakeIP: ^SteamNetworkingIPAddr, pOutRealIdentity: ^SteamNetworkingIdentity) -> EResult ---
	NetworkingUtils_SetGlobalConfigValueInt32 :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: i32) -> bool ---
	NetworkingUtils_SetGlobalConfigValueFloat :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: f32) -> bool ---
	NetworkingUtils_SetGlobalConfigValueString :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: cstring) -> bool ---
	NetworkingUtils_SetGlobalConfigValuePtr :: proc(self: ^INetworkingUtils, eValue: ESteamNetworkingConfigValue, val: rawptr) -> bool ---
}

@(link_prefix = "SteamAPI_")
foreign lib {
	SteamNetworkingIPAddr_ParseString :: proc(self: ^SteamNetworkingIPAddr, pszStr: cstring) -> bool ---
	SteamNetworkingIPAddr_Clear :: proc(self: ^SteamNetworkingIPAddr) ---
	SteamNetworkingIPAddr_IsIPv6AllZeros :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
	SteamNetworkingIPAddr_SetIPv6 :: proc(self: ^SteamNetworkingIPAddr, ipv6: ^u8, nPort: u16) ---
	SteamNetworkingIPAddr_SetIPv4 :: proc(self: ^SteamNetworkingIPAddr, nIP: u32, nPort: u16) ---
	SteamNetworkingIPAddr_IsIPv4 :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
	SteamNetworkingIPAddr_GetIPv4 :: proc(self: ^SteamNetworkingIPAddr) -> u32 ---
	SteamNetworkingIPAddr_SetIPv6LocalHost :: proc(self: ^SteamNetworkingIPAddr, nPort: u16) ---
	SteamNetworkingIPAddr_IsLocalHost :: proc(self: ^SteamNetworkingIPAddr) -> bool ---
	SteamNetworkingIPAddr_ToString :: proc(self: ^SteamNetworkingIPAddr, buf: ^u8, cbBuf: u32, bWithPort: bool) ---
	SteamNetworkingIPAddr_GetFakeIPType :: proc(self: ^SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType ---
	SteamNetworkingIPAddr_IsFakeIP :: proc(self: ^SteamNetworkingIPAddr) -> bool ---


	SteamNetworkingMessage_t_Release :: proc(self: ^SteamNetworkingMessage) ---


}
