package gns


ESteamNetConnectionEnd :: enum i32 {
	Invalid                          = 0,
	App_Min                          = 1000,
	App_Generic                      = 1000,
	App_Max                          = 1999,
	AppException_Min                 = 2000,
	AppException_Generic             = 2000,
	AppException_Max                 = 2999,
	Local_Min                        = 3000,
	Local_OfflineMode                = 3001,
	Local_ManyRelayConnectivity      = 3002,
	Local_HostedServerPrimaryRelay   = 3003,
	Local_NetworkConfig              = 3004,
	Local_Rights                     = 3005,
	Local_P2P_ICE_NoPublicAddresses  = 3006,
	Local_Max                        = 3999,
	Remote_Min                       = 4000,
	Remote_Timeout                   = 4001,
	Remote_BadCrypt                  = 4002,
	Remote_BadCert                   = 4003,
	Remote_BadProtocolVersion        = 4006,
	Remote_P2P_ICE_NoPublicAddresses = 4007,
	Remote_Max                       = 4999,
	Misc_Min                         = 5000,
	Misc_Generic                     = 5001,
	Misc_InternalError               = 5002,
	Misc_Timeout                     = 5003,
	Misc_SteamConnectivity           = 5005,
	Misc_NoRelaySessionsToClient     = 5006,
	Misc_P2P_Rendezvous              = 5008,
	Misc_P2P_NAT_Firewall            = 5009,
	Misc_PeerSentNoConnection        = 5010,
	Misc_Max                         = 5999,
	_Force32Bit                      = 2147483647,
}


ESteamNetworkingConfigScope :: enum i32 {
	Global           = 1,
	SocketsInterface = 2,
	ListenSocket     = 3,
	Connection       = 4,
	_Force32Bit      = 2147483647,
}

ESteamNetworkingConfigDataType :: enum i32 {
	Int32       = 1,
	Int64       = 2,
	Float       = 3,
	String      = 4,
	Ptr         = 5,
	_Force32Bit = 2147483647,
}

ESteamNetworkingConfigValue :: enum i32 {
	Invalid                                        = 0,
	TimeoutInitial                                 = 24,
	TimeoutConnected                               = 25,
	SendBufferSize                                 = 9,
	ConnectionUserData                             = 40,
	SendRateMin                                    = 10,
	SendRateMax                                    = 11,
	NagleTime                                      = 12,
	IP_AllowWithoutAuth                            = 23,
	MTU_PacketSize                                 = 32,
	MTU_DataSize                                   = 33,
	Unencrypted                                    = 34,
	SymmetricConnect                               = 37,
	LocalVirtualPort                               = 38,
	DualWifi_Enable                                = 39,
	EnableDiagnosticsUI                            = 46,
	FakePacketLoss_Send                            = 2,
	FakePacketLoss_Recv                            = 3,
	FakePacketLag_Send                             = 4,
	FakePacketLag_Recv                             = 5,
	FakePacketReorder_Send                         = 6,
	FakePacketReorder_Recv                         = 7,
	FakePacketReorder_Time                         = 8,
	FakePacketDup_Send                             = 26,
	FakePacketDup_Recv                             = 27,
	FakePacketDup_TimeMax                          = 28,
	PacketTraceMaxBytes                            = 41,
	FakeRateLimit_Send_Rate                        = 42,
	FakeRateLimit_Send_Burst                       = 43,
	FakeRateLimit_Recv_Rate                        = 44,
	FakeRateLimit_Recv_Burst                       = 45,
	CallbacConnectionStatusChanged                 = 201,
	CallbacAuthStatusChanged                       = 202,
	CallbacRelayNetworkStatusChanged               = 203,
	CallbacMessagesSessionRequest                  = 204,
	CallbacMessagesSessionFailed                   = 205,
	CallbacCreateConnectionSignaling               = 206,
	CallbacFakeIPResult                            = 207,
	P2P_STUN_ServerList                            = 103,
	P2P_Transport_ICE_Enable                       = 104,
	P2P_Transport_ICE_Penalty                      = 105,
	P2P_Transport_SDR_Penalty                      = 106,
	P2P_TURN_ServerList                            = 107,
	P2P_TURN_UserList                              = 108,
	P2P_TURN_PassList                              = 109,
	P2P_Transport_ICE_Implementation               = 110,
	SDRClient_ConsecutitivePingTimeoutsFailInitial = 19,
	SDRClient_ConsecutitivePingTimeoutsFail        = 20,
	SDRClient_MinPingsBeforePingAccurate           = 21,
	SDRClient_SingleSocket                         = 22,
	SDRClient_ForceRelayCluster                    = 29,
	SDRClient_DebugTicketAddress                   = 30,
	SDRClient_ForceProxyAddr                       = 31,
	SDRClient_FakeClusterPing                      = 36,
	LogLevel_AckRTT                                = 13,
	LogLevel_PacketDecode                          = 14,
	LogLevel_Message                               = 15,
	LogLevel_PacketGaps                            = 16,
	LogLevel_P2PRendezvous                         = 17,
	LogLevel_SDRRelayPings                         = 18,
	DELETED_EnumerateDevVars                       = 35,
	_Force32Bit                                    = 2147483647,
}

ESteamNetworkingGetConfigValueResult :: enum i32 {
	BadValue           = -1,
	BadScopeObj        = -2,
	BufferTooSmall     = -3,
	OK                 = 1,
	OKInherited        = 2,
	Result__Force32Bit = 2147483647,
}

ESteamNetworkingSocketsDebugOutputType :: enum i32 {
	None        = 0,
	Bug         = 1,
	Error       = 2,
	Important   = 3,
	Warning     = 4,
	Msg         = 5,
	Verbose     = 6,
	Debug       = 7,
	Everything  = 8,
	_Force32Bit = 2147483647,
}

EServerMode :: enum i32 {
	Invalid                 = 0,
	NoAuthentication        = 1,
	Authentication          = 2,
	AuthenticationAndSecure = 3,
}

ESteamNetworkingIdentityType :: enum i32 {
	Invalid        = 0,
	SteamID        = 16,
	XboxPairwiseID = 17,
	SonyPSN        = 18,
	GoogleStadia   = 19,
	IPAddress      = 1,
	GenericString  = 2,
	GenericBytes   = 3,
	UnknownType    = 4,
	_Force32bit    = 2147483647,
}


EResult :: enum i32 {
	None                                    = 0,
	OK                                      = 1,
	Fail                                    = 2,
	NoConnection                            = 3,
	InvalidPassword                         = 5,
	LoggedInElsewhere                       = 6,
	InvalidProtocolVer                      = 7,
	InvalidParam                            = 8,
	FileNotFound                            = 9,
	Busy                                    = 10,
	InvalidState                            = 11,
	InvalidName                             = 12,
	InvalidEmail                            = 13,
	DuplicateName                           = 14,
	AccessDenied                            = 15,
	Timeout                                 = 16,
	Banned                                  = 17,
	AccountNotFound                         = 18,
	InvalidSteamID                          = 19,
	ServiceUnavailable                      = 20,
	NotLoggedOn                             = 21,
	Pending                                 = 22,
	EncryptionFailure                       = 23,
	InsufficientPrivilege                   = 24,
	LimitExceeded                           = 25,
	Revoked                                 = 26,
	Expired                                 = 27,
	AlreadyRedeemed                         = 28,
	DuplicateRequest                        = 29,
	AlreadyOwned                            = 30,
	IPNotFound                              = 31,
	PersistFailed                           = 32,
	LockingFailed                           = 33,
	LogonSessionReplaced                    = 34,
	ConnectFailed                           = 35,
	HandshakeFailed                         = 36,
	IOFailure                               = 37,
	RemoteDisconnect                        = 38,
	ShoppingCartNotFound                    = 39,
	Blocked                                 = 40,
	Ignored                                 = 41,
	NoMatch                                 = 42,
	AccountDisabled                         = 43,
	ServiceReadOnly                         = 44,
	AccountNotFeatured                      = 45,
	AdministratorOK                         = 46,
	ContentVersion                          = 47,
	TryAnotherCM                            = 48,
	PasswordRequiredToKickSession           = 49,
	AlreadyLoggedInElsewhere                = 50,
	Suspended                               = 51,
	Cancelled                               = 52,
	DataCorruption                          = 53,
	DiskFull                                = 54,
	RemoteCallFailed                        = 55,
	PasswordUnset                           = 56,
	ExternalAccountUnlinked                 = 57,
	PSNTicketInvalid                        = 58,
	ExternalAccountAlreadyLinked            = 59,
	RemoteFileConflict                      = 60,
	IllegalPassword                         = 61,
	SameAsPreviousValue                     = 62,
	AccountLogonDenied                      = 63,
	CannotUseOldPassword                    = 64,
	InvalidLoginAuthCode                    = 65,
	AccountLogonDeniedNoMail                = 66,
	HardwareNotCapableOfIPT                 = 67,
	IPTInitError                            = 68,
	ParentalControlRestricted               = 69,
	FacebookQueryError                      = 70,
	ExpiredLoginAuthCode                    = 71,
	IPLoginRestrictionFailed                = 72,
	AccountLockedDown                       = 73,
	AccountLogonDeniedVerifiedEmailRequired = 74,
	NoMatchingURL                           = 75,
	BadResponse                             = 76,
	RequirePasswordReEntry                  = 77,
	ValueOutOfRange                         = 78,
	UnexpectedError                         = 79,
	Disabled                                = 80,
	InvalidCEGSubmission                    = 81,
	RestrictedDevice                        = 82,
	RegionLocked                            = 83,
	RateLimitExceeded                       = 84,
	AccountLoginDeniedNeedTwoFactor         = 85,
	ItemDeleted                             = 86,
	AccountLoginDeniedThrottle              = 87,
	TwoFactorCodeMismatch                   = 88,
	TwoFactorActivationCodeMismatch         = 89,
	AccountAssociatedToMultiplePartners     = 90,
	NotModified                             = 91,
	NoMobileDevice                          = 92,
	TimeNotSynced                           = 93,
	SmsCodeFailed                           = 94,
	AccountLimitExceeded                    = 95,
	AccountActivityLimitExceeded            = 96,
	PhoneActivityLimitExceeded              = 97,
	RefundToWallet                          = 98,
	EmailSendFailure                        = 99,
	NotSettled                              = 100,
	NeedCaptcha                             = 101,
	GSLTDenied                              = 102,
	GSOwnerDenied                           = 103,
	InvalidItemType                         = 104,
	IPBanned                                = 105,
	GSLTExpired                             = 106,
	InsufficientFunds                       = 107,
	TooManyPending                          = 108,
	NoSiteLicensesFound                     = 109,
	WGNetworkSendExceeded                   = 110,
	AccountNotFriends                       = 111,
	LimitedUserAccount                      = 112,
	CantRemoveItem                          = 113,
	AccountDeleted                          = 114,
	ExistingUserCancelledLicense            = 115,
	CommunityCooldown                       = 116,
	NoLauncherSpecified                     = 117,
	MustAgreeToSSA                          = 118,
	LauncherMigrated                        = 119,
	SteamRealmMismatch                      = 120,
	InvalidSignature                        = 121,
	ParseFailure                            = 122,
	NoVerifiedPhone                         = 123,
	InsufficientBattery                     = 124,
	ChargerRequired                         = 125,
	CachedCredentialInvalid                 = 126,
	PhoneNumberIsVOIP                       = 127,
}

ESNetSocketConnectionType :: enum i32 {
	NotConnected = 0,
	UDP          = 1,
	UDPRelay     = 2,
}

ESteamNetworkingConnectionState :: enum i32 {
	None                   = 0,
	Connecting             = 1,
	FindingRoute           = 2,
	Connected              = 3,
	ClosedByPeer           = 4,
	ProblemDetectedLocally = 5,
	FinWait                = -1,
	Linger                 = -2,
	Dead                   = -3,
	_Force32Bit            = 2147483647,
}

ESteamNetworkingFakeIPType :: enum i32 {
	Invalid     = 0,
	NotFake     = 1,
	GlobalIPv4  = 2,
	LocalIPv4   = 3,
	_Force32Bit = 2147483647,
}


ESteamIPType :: enum i32 {
	IPv4 = 0,
	IPv6 = 1,
}
