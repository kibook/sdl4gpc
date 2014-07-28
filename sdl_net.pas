module SDL_net;

{$L SDL_net}

export SDL_net = all;

import
  SDL;

const
  SDL_NET_MAJOR_VERSION = 1;
  SDL_NET_MINOR_VERSION = 2;
  SDL_NET_PATCHLEVEL = 5;

  INADDR_ANY = $00000000;
  INADDR_NONE = $FFFFFFFF;

  SDLNET_MAX_UDPCHANNELS = 32;
  SDLNET_MAX_UDPADDRESSES = 4;

type
  PIPAddress = ^TIPAddress;
  TIPAddress = record
    host: uint32;
    port: uint32;
  end;

  PTCPSocket = ^TTCPSocket;
  TTCPSocket = record
    ready: cinteger;
    channel: cinteger;
    remoteAddress: TIPAddress;
    localAddress: TIPAddress;
    sflag: cinteger;
  end;

  PUDP_Channel = ^TUDP_Channel;
  TUDP_Channel = record
    numbound: cinteger;
    address: array [0..SDLNET_MAX_UDPADDRESSES - 1] of TIPAddress;
  end;

  PUDPSocket = ^TUDPSocket;
  TUDPSocket = record
    ready: cinteger;
    channel: cinteger;
    address: TIPAddress;
    binding: array [0..SDLNET_MAX_UDPCHANNELS - 1] of TUDP_Channel;
  end;

  PPUDPpacket = ^PUDPpacket;
  PUDPpacket = ^TUDPpacket;
  TUDPpacket = record
    channel: cinteger;
    data: puint8;
    len: cinteger;
    maxlen: cinteger;
    status: cinteger;
    address: TIPAddress;
  end;

  PPSDLNet_Socket = ^PSDLNet_Socket;
  PSDLNet_Socket = ^TSDLNet_Socket;
  TSDLNet_Socket = record
    ready: cinteger;
    channel: cinteger;
  end;

  PSDLNet_SocketSet = ^TSDLNet_SocketSet;
  TSDLNet_SocketSet = record
    numsockets: cinteger;
    maxsockets: cinteger;
    sockets: PPSDLNet_Socket;
  end;

  PSDLNet_GenericSocket = ^TSDLNet_GenericSocket;
  TSDLNet_GenericSocket = record
    ready: cinteger;
  end;

function SDLNet_Init: cinteger; external name 'SDLNet_Init';

function SDLNet_Quit: cinteger; external name 'SDLNet_Quit';

function SDLNet_ResolveHost(var address: TIPAddress; host: cstring;
  port: uint16): cinteger; external name 'SDLNet_ResolveHost';

function SDLNet_ResolveIP(var ip: TIPAddress): cstring;
  external name 'SDLNet_ResolveIP';

function SDLNet_TCP_Open(var ip: TIPAddress): PTCPSocket;
  external name 'SDLNet_TCP_Open';

function SDLNet_TCP_Accept(server: PTCPSocket): PTCPSocket;
  external name 'SDLNet_TCP_Accept';

function SDLNet_TCP_GetPeerAddress(sock: PTCPSocket): PIPAddress;
  external name 'SDLNet_TCP_GetPeerAddress';

function SDLNet_TCP_Send(sock: PTCPSocket; data: pointer;
  len: cinteger): cinteger; external name 'SDLNet_TCP_Send';

function SDLNet_TCP_Recv(sock: PTCPSocket; data: pointer;
  maxlen: cinteger): cinteger; external name 'SDLNet_TCP_Recv';

procedure SDLNet_TCP_Close(sock: PTCPSocket);
  external name 'SDLNet_TCP_Close';

function SDLNet_AllocPacket(size: cinteger): PUDPpacket;
  external name 'SDLNet_AllocPacket';

function SDLNet_ResizePacket(packet: PUDPpacket;
  newsize: cinteger): cinteger; external name 'SDLNet_ResizePacket';

procedure SDLNet_FreePacket(packet: PUDPpacket);
  external name 'SDLNet_FreePacket';

function SDLNet_AllocPacketV(howmany, size: cinteger): PUDPpacket;
  external name 'SDLNet_AllocPacketV';

procedure SDLNet_FreePacketV(packetV: PUDPpacket);
  external name 'SDLNet_FreePacketV';

function SDLNet_UDP_Open(port: uint16): PUDPSocket;
  external name 'SDLNet_UDP_Open';

function SDLNet_UDP_Bind(sock: PUDPSocket; channel: cinteger;
  var addresses: TIPAddress): cinteger; external name 'SDLNet_UDP_Bind';

procedure SDLNet_UDP_Unbind(sock: PUDPSocket; channel: cinteger);
  external name 'SDLNet_UDP_Unbind';

function SDLNet_UDP_GetPeerAddress(sock: PUDPSocket;
  channel: cinteger): PIPAddress; external name 'SDLNet_UDP_GetPeerAddress';

function SDLNet_UDP_SendV(sock: PUDPSocket; packets: PPUDPpacket;
  npackets: cinteger): cinteger; external name 'SDLNet_UDP_SendV';

function SDLNet_UDP_Send(sock: PUDPSocket; channel: cinteger;
  packet: PUDPpacket): cinteger; external name 'SDLNet_UDP_Send';

function SDLNet_UDP_RecvV(sock: PUDPsocket; packets: PPUDPpacket): cinteger;
  external name 'SDLNet_UDP_RecvV';

function SDLNet_UDP_Recv(sock: PUDPsocket; packet: PUDPpacket): cinteger;
  external name 'SDLNet_UDP_Recv';

procedure SDLNet_UDP_Close(sock: PUDPsocket);
  external name 'SDLNet_UDP_Close';

function SDLNet_AllocSocketSet(maxsockets: cinteger): PSDLNet_SocketSet;
  external name 'SDLNet_AllocSocketSet';

function SDLNet_AddSocket(set_: PSDLNet_SocketSet;
  sock: PSDLNet_GenericSocket): cinteger; external name 'SDLNet_AddSocket';

function SDLNet_DelSocket(set_: PSDLNet_SocketSet;
  sock: PSDLNet_GenericSocket): cinteger; external name 'SDLNet_DelSocket';

function SDLNet_CheckSockets(set_: PSDLNet_SocketSet;
  timeout: sint32): cinteger; external name 'SDLNet_CheckSockets';

procedure SDLNet_FreeSocketSet(set_: PSDLNet_SocketSet);
  external name 'SDLNet_FreeSocketSet';

procedure SDLNet_Write16(value: uint16; area: pointer);
  external name 'SDLNet_Write16';

procedure SDLNet_Write32(value: uint32; area: pointer);
  external name 'SDLNet_Write32';

function SDLNet_Read16(area: pointer): uint16;
  external name 'SDLNet_Read16';

function SDLNet_Read32(area: pointer): uint32;
  external name 'SDLNet_Read32';

procedure SDLNet_SetError(fmt: cstring); external name 'SDLNet_SetError';

function SDLNet_GetError: cstring; external name 'SDLNet_GetError';

end;

end.
