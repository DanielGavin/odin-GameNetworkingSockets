package gns


HSteamNetConnection :: distinct u32
HSteamListenSocket :: distinct u32
HSteamNetPollGroup :: distinct u32

SNetSocket :: u32
SNetListenSocket :: u32

SteamNetworkingErrMsg :: [1024]u8
SteamNetworkingPOPID :: u32
SteamNetworkingMicroseconds :: i64 // c.longlong

HSteamNetConnection_Invalid: HSteamNetConnection : 0
HSteamListenSocket_Invalid: HSteamListenSocket : 0
HSteamNetPollGroup_Invalid: HSteamNetPollGroup : 0

INetworking :: distinct rawptr
INetworkingSockets :: distinct rawptr
INetworkingUtils :: distinct rawptr
INetworkingFakeUDPPort :: distinct rawptr

//hack
CSteamID :: u64

SteamNetConnectionRealTimeLaneStatus :: struct #align (CALLBACK_ALIGN) {
	cbPendingUnreliable:   i32,
	cbPendingReliable:     i32,
	cbSentUnackedReliable: i32,
	_reservePad1:          i32,
	usecQueueTime:         SteamNetworkingMicroseconds,
	reserved:              [10]u32,
}

SteamNetConnectionRealTimeStatus :: struct #align (CALLBACK_ALIGN) {
	eState:                    ESteamNetworkingConnectionState,
	nPing:                     i32,
	flConnectionQualityLocal:  f32,
	flConnectionQualityRemote: f32,
	flOutPacketsPerSec:        f32,
	flOutBytesPerSec:          f32,
	flInPacketsPerSec:         f32,
	flInBytesPerSec:           f32,
	nSendRateBytesPerSecond:   i32,
	cbPendingUnreliable:       i32,
	cbPendingReliable:         i32,
	cbSentUnackedReliable:     i32,
	usecQueueTime:             SteamNetworkingMicroseconds,
	reserved:                  [16]u32,
}

SteamNetworkingFakeIPResult :: struct #align (CALLBACK_ALIGN) {
	eResult:  EResult,
	identity: SteamNetworkingIdentity,
	unIP:     u32,
	unPorts:  [8]u16,
}

SteamNetConnectionStatusChangedCallback :: struct #align (CALLBACK_ALIGN) {
	hConn:     HSteamNetConnection,
	info:      SteamNetConnectionInfo,
	eOldState: ESteamNetworkingConnectionState,
}

SteamNetConnectionInfo :: struct {
	identityRemote:          SteamNetworkingIdentity,
	nUserData:               i64,
	hListenSocket:           HSteamListenSocket,
	addrRemote:              SteamNetworkingIPAddr,
	_pad1:                   u16,
	idPOPRemote:             SteamNetworkingPOPID,
	idPOPRelay:              SteamNetworkingPOPID,
	eState:                  ESteamNetworkingConnectionState,
	eEndReason:              i32,
	szEndDebug:              [128]u8,
	szConnectionDescription: [128]u8,
	nFlags:                  i32,
	reserved:                [63]u32,
}

SteamIPAddress :: struct {
	rgubIPv6: [16]u8,
	eType:    ESteamIPType,
}

SteamNetworkingIPAddr :: struct #align (1) {
	ipv6: [16]u8,
	port: u16,
}

SteamNetworkingIdentity :: struct #align (1) {
	eType:              ESteamNetworkingIdentityType,
	cbSize:             i32,
	szUnknownRawString: [128]u8,
}

SteamNetworkingMessage :: struct {
	pData:            rawptr,
	cbSize:           i32,
	conn:             HSteamNetConnection,
	identityPeer:     SteamNetworkingIdentity,
	nConnUserData:    i64,
	usecTimeReceived: SteamNetworkingMicroseconds,
	nMessageNumber:   i64,
	pfnFreeData:      #type proc "c" (_: ^SteamNetworkingMessage),
	pfnRelease:       #type proc "c" (_: ^SteamNetworkingMessage),
	nChannel:         i32,
	nFlags:           i32,
	nUserData:        i64,
	idxLane:          u16,
	_pad1__:          u16,
}


SteamNetworkingConfigValue :: struct {
	eValue:    ESteamNetworkingConfigValue,
	eDataType: ESteamNetworkingConfigDataType,
	val:       struct #raw_union {
		int32:  i32,
		int64:  i64,
		float:  f32,
		string: cstring,
		ptr:    rawptr,
	},
}
