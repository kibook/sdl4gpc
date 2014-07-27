module SDL;

{$L SDL}
{$L SDLmain}

export SDL = all;

const
  SDL_MAJOR_VERSION = 1;
  SDL_MINOR_VERSION = 2;
  SDL_PATCHLEVEL = 11;

  SDL_INIT_TIMER = $00000001;
  SDL_INIT_AUDIO = $00000010;
  SDL_INIT_VIDEO = $00000020;
  SDL_INIT_CDROM = $00000100;
  SDL_INIT_JOYSTICK = $00000200;
  SDL_INIT_NOPARACHUTE = $00100000;
  SDL_INIT_EVENTTHREAD = $01000000;
  SDL_INIT_EVERYTHING = $0000FFFF;

  ERR_MAX_STRLEN = 128;
  ERR_MAX_ARGS = 5;

  SDL_PRESSED = $01;
  SDL_RELEASED = $00;

  SDL_TIMESLICE = 10;
  TIMER_RESOLUTION = 10;

  AUDIO_U8 = $0008;
  AUDIO_S8 = $8008;
  AUDIO_U16LSB = $0010;
  AUDIO_S16LSB = $8010;
  AUDIO_U16MSB = $1010;
  AUDIO_S16MSB = $9010; 
  AUDIO_U16 = AUDIO_U16LSB;
  AUDIO_S16 = AUDIO_S16LSB;

  SDL_MAX_TRACKS = 99;
  SDL_AUDIO_TRACK = $00;
  SDL_DATA_TRACK = $04;

  CD_FPS = 75;

  SDL_LIL_ENDIAN = 1234;
  SDL_BIG_ENDIAN = 4321;

  {$IFDEF i386}
  SDL_BYTEORDER = SDL_LIL_ENDIAN;
  AUDIO_U16SYS = AUDIO_U16LSB;
  AUDIO_S16SYS = AUDIO_S16LSB;
  {$ELSE}
  SDL_BYTEORDER = SDL_BIG_ENDIAN;
  AUDIO_U16SYS = AUDIO_U16MSB;
  AUDIO_S16SYS = AUDIO_S16MSB;
  {$ENDIF}

  SDL_MIX_MAXVOLUME = 128;

  MAX_JOYSTICKS = 2;
  MAX_AXES = 6;
  MAX_BUTTONS = 32;
  AXIS_MIN = -32768;
  AXIS_MAX = 32767;
  JOY_AXIS_THRESHOLD = (((AXIS_MAX) - (AXIS_MIN)) / 100);
  SDL_HAT_CENTERED = $00;
  SDL_HAT_UP = $01;
  SDL_HAT_RIGHT = $02;
  SDL_HAT_DOWN = $04;
  SDL_HAT_LEFT = $08;
  SDL_HAT_RIGHTUP = SDL_HAT_RIGHT or SDL_HAT_UP;
  SDL_HAT_RIGHTDOWN = SDL_HAT_RIGHT or SDL_HAT_DOWN;
  SDL_HAT_LEFTUP = SDL_HAT_LEFT or SDL_HAT_UP;
  SDL_HAT_LEFTDOWN = SDL_HAT_LEFT or SDL_HAT_DOWN;

  SDL_NOEVENT = 0;
  SDL_ACTIVEEVENT = 1;
  SDL_KEYDOWN = 2;
  SDL_KEYUP = 3;
  SDL_MOUSEMOTION = 4;
  SDL_MOUSEBUTTONDOWN = 5;
  SDL_MOUSEBUTTONUP = 6;
  SDL_JOYAXISMOTION = 7;
  SDL_JOYBALLMOTION = 8;
  SDL_JOYHATMOTION = 9;
  SDL_JOYBUTTONDOWN = 10;
  SDL_JOYBUTTONUP = 11;
  SDL_QUITEV = 12;
  SDL_SYSWMEVENT = 13;
  SDL_EVENT_RESERVEDA = 14;
  SDL_EVENT_RESERVED = 15;
  SDL_VIDEORESIZE = 16;
  SDL_VIDEOEXPOSE = 17;
  SDL_EVENT_RESERVED2 = 18;
  SDL_EVENT_RESERVED3 = 19;
  SDL_EVENT_RESERVED4 = 20;
  SDL_EVENT_RESERVED5 = 21;
  SDL_EVENT_RESERVED6 = 22;
  SDL_EVENT_RESERVED7 = 23;
  SDL_USEREVENT = 24;
  SDL_NUMEVENTS = 32;
  SDL_ALLEVENTS = $FFFFFFFF;
  SDL_ACTIVEEVENTMASK = 1 shl SDL_ACTIVEEVENT;
  SDL_KEYDOWNMASK = 1 shl SDL_KEYDOWN;
  SDL_KEYUPMASK = 1 shl SDL_KEYUP;
  SDL_MOUSEMOTIONMASK = 1 shl SDL_MOUSEMOTION;
  SDL_MOUSEBUTTONDOWNMASK = 1 shl SDL_MOUSEBUTTONDOWN;
  SDL_MOUSEBUTTONUPMASK = 1 shl SDL_MOUSEBUTTONUP;
  SDL_MOUSEEVENTMASK = 1 shl SDL_MOUSEMOTION or
    1 shl SDL_MOUSEBUTTONDOWN or 1 shl SDL_MOUSEBUTTONUP;
  SDL_JOYAXISMOTIONMASK = 1 shl SDL_JOYAXISMOTION;
  SDL_JOYBALLMOTIONMASK = 1 shl SDL_JOYBALLMOTION;
  SDL_JOYHATMOTIONMASK = 1 shl SDL_JOYHATMOTION;
  SDL_JOYBUTTONDOWNMASK = 1 shl SDL_JOYBUTTONDOWN;
  SDL_JOYBUTTONUPMASK = 1 shl SDL_JOYBUTTONUP;
  SDL_JOYEVENTMASK = 1 shl SDL_JOYAXISMOTION or
    1 shl SDL_JOYBALLMOTION or 1 shl SDL_JOYHATMOTION or
    1 shl SDL_JOYBUTTONDOWN or 1 shl SDL_JOYBUTTONUP;
  SDL_VIDEORESIZEMASK = 1 shl SDL_VIDEORESIZE;
  SDL_QUITMASK = 1 shl SDL_QUITEV;
  SDL_SYSWMEVENTMASK = 1 shl SDL_SYSWMEVENT;

  SDL_QUERY = -1;
  SDL_IGNORE = 0;
  SDL_DISABLE = 0;
  SDL_ENABLE = 1;

  SDL_ALL_HOTKEYS = $FFFFFFFF;

  SDL_DEFAULT_REPEAT_DELAY = 500;
  SDL_DEFAULT_REPEAT_INTERVAL = 30;

  SDLK_UNKNOWN = 0;
  SDLK_FIRST = 0;
  SDLK_BACKSPACE = 8;
  SDLK_TAB = 9;
  SDLK_CLEAR = 12;
  SDLK_RETURN = 13;
  SDLK_PAUSE = 19;
  SDLK_ESCAPE = 27;
  SDLK_SPACE = 32;
  SDLK_EXCLAIM = 33;
  SDLK_QUOTEDBL = 34;
  SDLK_HASH = 35;
  SDLK_DOLLAR = 36;
  SDLK_AMPERSAND = 38;
  SDLK_QUOTE = 39;
  SDLK_LEFTPAREN = 40;
  SDLK_RIGHTPAREN = 41;
  SDLK_ASTERISK = 42;
  SDLK_PLUS = 43;
  SDLK_COMMA = 44;
  SDLK_MINUS = 45;
  SDLK_PERIOD = 46;
  SDLK_SLASH = 47;
  SDLK_0 = 48;
  SDLK_1 = 49;
  SDLK_2 = 50;
  SDLK_3 = 51;
  SDLK_4 = 52;
  SDLK_5 = 53;
  SDLK_6 = 54;
  SDLK_7 = 55;
  SDLK_8 = 56;
  SDLK_9 = 57;
  SDLK_COLON = 58;
  SDLK_SEMICOLON = 59;
  SDLK_LESS = 60;
  SDLK_EQUALS = 61;
  SDLK_GREATER = 62;
  SDLK_QUESTION = 63;
  SDLK_AT = 64;
  SDLK_LEFTBRACKET = 91;
  SDLK_BACKSLASH = 92;
  SDLK_RIGHTBRACKET = 93;
  SDLK_CARET = 94;
  SDLK_UNDERSCORE = 95;
  SDLK_BACKQUOTE = 96;
  SDLK_a = 97;
  SDLK_b = 98;
  SDLK_c = 99;
  SDLK_d = 100;
  SDLK_e = 101;
  SDLK_f = 102;
  SDLK_g = 103;
  SDLK_h = 104;
  SDLK_i = 105;
  SDLK_j = 106;
  SDLK_k = 107;
  SDLK_l = 108;
  SDLK_m = 109;
  SDLK_n = 110;
  SDLK_o = 111;
  SDLK_p = 112;
  SDLK_q = 113;
  SDLK_r = 114;
  SDLK_s = 115;
  SDLK_t = 116;
  SDLK_u = 117;
  SDLK_v = 118;
  SDLK_w = 119;
  SDLK_x = 120;
  SDLK_y = 121;
  SDLK_z = 122;
  SDLK_DELETE = 127;
  SDLK_WORLD_0 = 160;
  SDLK_WORLD_1 = 161;
  SDLK_WORLD_2 = 162;
  SDLK_WORLD_3 = 163;
  SDLK_WORLD_4 = 164;
  SDLK_WORLD_5 = 165;
  SDLK_WORLD_6 = 166;
  SDLK_WORLD_7 = 167;
  SDLK_WORLD_8 = 168;
  SDLK_WORLD_9 = 169;
  SDLK_WORLD_10 = 170;
  SDLK_WORLD_11 = 171;
  SDLK_WORLD_12 = 172;
  SDLK_WORLD_13 = 173;
  SDLK_WORLD_14 = 174;
  SDLK_WORLD_15 = 175;
  SDLK_WORLD_16 = 176;
  SDLK_WORLD_17 = 177;
  SDLK_WORLD_18 = 178;
  SDLK_WORLD_19 = 179;
  SDLK_WORLD_20 = 180;
  SDLK_WORLD_21 = 181;
  SDLK_WORLD_22 = 182;
  SDLK_WORLD_23 = 183;
  SDLK_WORLD_24 = 184;
  SDLK_WORLD_25 = 185;
  SDLK_WORLD_26 = 186;
  SDLK_WORLD_27 = 187;
  SDLK_WORLD_28 = 188;
  SDLK_WORLD_29 = 189;
  SDLK_WORLD_30 = 190;
  SDLK_WORLD_31 = 191;
  SDLK_WORLD_32 = 192;
  SDLK_WORLD_33 = 193;
  SDLK_WORLD_34 = 194;
  SDLK_WORLD_35 = 195;
  SDLK_WORLD_36 = 196;
  SDLK_WORLD_37 = 197;
  SDLK_WORLD_38 = 198;
  SDLK_WORLD_39 = 199;
  SDLK_WORLD_40 = 200;
  SDLK_WORLD_41 = 201;
  SDLK_WORLD_42 = 202;
  SDLK_WORLD_43 = 203;
  SDLK_WORLD_44 = 204;
  SDLK_WORLD_45 = 205;
  SDLK_WORLD_46 = 206;
  SDLK_WORLD_47 = 207;
  SDLK_WORLD_48 = 208;
  SDLK_WORLD_49 = 209;
  SDLK_WORLD_50 = 210;
  SDLK_WORLD_51 = 211;
  SDLK_WORLD_52 = 212;
  SDLK_WORLD_53 = 213;
  SDLK_WORLD_54 = 214;
  SDLK_WORLD_55 = 215;
  SDLK_WORLD_56 = 216;
  SDLK_WORLD_57 = 217;
  SDLK_WORLD_58 = 218;
  SDLK_WORLD_59 = 219;
  SDLK_WORLD_60 = 220;
  SDLK_WORLD_61 = 221;
  SDLK_WORLD_62 = 222;
  SDLK_WORLD_63 = 223;
  SDLK_WORLD_64 = 224;
  SDLK_WORLD_65 = 225;
  SDLK_WORLD_66 = 226;
  SDLK_WORLD_67 = 227;
  SDLK_WORLD_68 = 228;
  SDLK_WORLD_69 = 229;
  SDLK_WORLD_70 = 230;
  SDLK_WORLD_71 = 231;
  SDLK_WORLD_72 = 232;
  SDLK_WORLD_73 = 233;
  SDLK_WORLD_74 = 234;
  SDLK_WORLD_75 = 235;
  SDLK_WORLD_76 = 236;
  SDLK_WORLD_77 = 237;
  SDLK_WORLD_78 = 238;
  SDLK_WORLD_79 = 239;
  SDLK_WORLD_80 = 240;
  SDLK_WORLD_81 = 241;
  SDLK_WORLD_82 = 242;
  SDLK_WORLD_83 = 243;
  SDLK_WORLD_84 = 244;
  SDLK_WORLD_85 = 245;
  SDLK_WORLD_86 = 246;
  SDLK_WORLD_87 = 247;
  SDLK_WORLD_88 = 248;
  SDLK_WORLD_89 = 249;
  SDLK_WORLD_90 = 250;
  SDLK_WORLD_91 = 251;
  SDLK_WORLD_92 = 252;
  SDLK_WORLD_93 = 253;
  SDLK_WORLD_94 = 254;
  SDLK_WORLD_95 = 255;
  SDLK_KP0 = 256;
  SDLK_KP1 = 257;
  SDLK_KP2 = 258;
  SDLK_KP3 = 259;
  SDLK_KP4 = 260;
  SDLK_KP5 = 261;
  SDLK_KP6 = 262;
  SDLK_KP7 = 263;
  SDLK_KP8 = 264;
  SDLK_KP9 = 265;
  SDLK_KP_PERIOD = 266;
  SDLK_KP_DIVIDE = 267;
  SDLK_KP_MULTIPLY = 268;
  SDLK_KP_MINUS = 269;
  SDLK_KP_PLUS = 270;
  SDLK_KP_ENTER = 271;
  SDLK_KP_EQUALS = 272;
  SDLK_UP = 273;
  SDLK_DOWN = 274;
  SDLK_RIGHT = 275;
  SDLK_LEFT = 276;
  SDLK_INSERT = 277;
  SDLK_HOME = 278;
  SDLK_END = 279;
  SDLK_PAGEUP = 280;
  SDLK_PAGEDOWN = 281;
  SDLK_F1 = 282;
  SDLK_F2 = 283;
  SDLK_F3 = 284;
  SDLK_F4 = 285;
  SDLK_F5 = 286;
  SDLK_F6 = 287;
  SDLK_F7 = 288;
  SDLK_F8 = 289;
  SDLK_F9 = 290;
  SDLK_F10 = 291;
  SDLK_F11 = 292;
  SDLK_F12 = 293;
  SDLK_F13 = 294;
  SDLK_F14 = 295;
  SDLK_F15 = 296;
  SDLK_NUMLOCK = 300;
  SDLK_CAPSLOCK = 301;
  SDLK_SCROLLOCK = 302;
  SDLK_RSHIFT = 303;
  SDLK_LSHIFT = 304;
  SDLK_RCTRL = 305;
  SDLK_LCTRL = 306;
  SDLK_RALT = 307;
  SDLK_LALT = 308;
  SDLK_RMETA = 309;
  SDLK_LMETA = 310;
  SDLK_LSUPER = 311;
  SDLK_RSUPER = 312;
  SDLK_MODE = 313;
  SDLK_COMPOSE = 314;
  SDLK_HELP = 315;
  SDLK_PRINT = 316;
  SDLK_SYSREQ = 317;
  SDLK_BREAK = 318;
  SDLK_MENU = 319;
  SDLK_POWER = 320;
  SDLK_EURO = 321;
  KMOD_NONE = $0000;
  KMOD_LSHIFT = $0001;
  KMOD_RSHIFT = $0002;
  KMOD_LCTRL = $0040;
  KMOD_RCTRL = $0080;
  KMOD_LALT = $0100;
  KMOD_RALT = $0200;
  KMOD_LMETA = $0400;
  KMOD_RMETA = $0800;
  KMOD_NUM = $1000;
  KMOD_CAPS = $2000;
  KMOD_MODE = 44000;
  KMOD_RESERVED = $8000;
  KMOD_CTRL = (KMOD_LCTRL or KMOD_RCTRL);
  KMOD_SHIFT = (KMOD_LSHIFT or KMOD_RSHIFT);
  KMOD_ALT = (KMOD_LALT or KMOD_RALT);
  KMOD_META = (KMOD_LMETA or KMOD_RMETA);

  SDL_ALPHA_OPAQUE = 255;
  SDL_ALPHA_TRANSPARENT = 0;

  SDL_SWSURFACE = $00000000;
  SDL_HWSURFACE = $00000001;
  SDL_ASYNCBLIT = $00000004;
  SDL_ANYFORMAT = $10000000;
  SDL_HWPALETTE = $20000000;
  SDL_DOUBLEBUF = $40000000;
  SDL_OPENGL = $00000002;
  SDL_OPENGLBLIT = $00000002;
  SDL_RESIZABLE = $00000010;
  SDL_NOFRAME = $00000020;
  SDL_HWACCEL = $00000100;
  SDL_SRCCOLORKEY = $00001000;
  SDL_RLEACCELOK = $00002000;
  SDL_RLEACCEL = $00004000;
  SDL_SRCALPHA = $00010000;
  SDL_SRCCLIPPING = $00100000;
  SDL_PREALLOC = $01000000;

  SDL_YV12_OVERLAY = $32315659;
  SDL_IYUV_OVERLAY = $56555949;
  SDL_YUY2_OVERLAY = $32595559;
  SDL_UYVY_OVERLAY = $59565955;
  SDL_YVYU_OVERLAY = $55595659;

  SDL_LOGPAL = $01;
  SDL_PHYSPAL = $02;

  SDL_BUTTON_LEFT = 1;
  SDL_BUTTON_MIDDLE = 2;
  SDL_BUTTON_RIGHT = 3;
  SDL_BUTTON_WHEELUP = 4;
  SDL_BUTTON_WHEELDOWN = 5;
  SDL_BUTTON_LMASK = SDL_PRESSED shl (SDL_BUTTON_LEFT - 1);
  SDL_BUTTON_MMASK = SDL_PRESSED shl (SDL_BUTTON_MIDDLE - 1);
  SDL_BUTTOM_RMASK = SDL_PRESSED shl (SDL_BUTTON_RIGHT - 1);

  SDL_APPMOUSEFOCUS = $01;
  SDL_APPINPUTFOCUS = $02;
  SDL_APPACTIVE = $04;

  SDL_MUTEX_TIMEOUT = 1;
  SDL_MUTEX_MAXWAIT = not Cardinal(0);

type
  THandle = Cardinal;

  TSDL_Bool = (SDL_FALSE, SDL_TRUE);

  PPUInt8 = ^PUInt8;
  PUInt8 = ^UInt8;
  UInt8 = Cardinal attribute(Size = 8);

  PSint8 = ^Sint8;
  Sint8 = Integer attribute(Size = 8);

  PUInt16 = ^UInt16;
  UInt16 = Cardinal attribute(Size = 16);

  PSint16 = ^Sint16;
  Sint16 = Integer attribute(Size = 16);

  PUInt32 = ^UInt32;
  UInt32 = Cardinal attribute(Size = 32);
  
  SInt32 = Integer attribute(Size = 32);

  PInt = ^CInteger;

  PUInt64 = ^UInt64;
  UInt64 = record
    hi: UInt32;
    lo: UInt32;
  end;

  PSInt64 = ^SInt64;
  SInt64 = record
    hi: UInt32;
    lo: UInt32;
  end;

  PUInt8Array = ^TUInt8Array;
  TUInt8Array = array [0..MaxInt shr 1] of UInt8;

  TSDL_GrabMode = CInteger;

  TSDL_ErrorCode = (
    SDL_ENOMEM,
    SDL_EFREAD,
    SDL_EFWRITE,
    SDL_EFSEEK,
    SDL_LASTERROR
  );

  TArg = record
    case Byte of
      0: (value_ptr: Pointer);
      2: (value_i: CInteger);
      3: (value_f: Double);
      4: (buf: array [0..ERR_MAX_STRLEN - 1] of Byte);
  end;

  PSDL_Error = ^TSDL_Error;
  TSDL_Error = record
    error: CInteger;
    key: array [0..ERR_MAX_STRLEN - 1] of Byte;
    argc: CInteger;
    args: array [0..ERR_MAX_ARGS - 1] of TArg;
  end;

  TStdio = record
    autoclose: CInteger;
    fp: Pointer;
  end;

  TMem = record
    base: PUInt8;
    here: PUInt8;
    stop: PUInt8;
  end;

  TUnknown = record
    data1: Pointer;
  end;

  PSDL_RWops = ^TSDL_RWops;
  TSeek = function(context: PSDL_RWops; offset: CInteger;
    whence: CInteger): CInteger;
  TRead = function(context: PSDL_RWops; Ptr: Pointer;
    size, maxnum: CInteger): CInteger;
  TWrite = function(context: PSDL_RWops; Ptr: Pointer;
    size, num: CInteger): CInteger;
  TClose = function(context: PSDL_RWops): CInteger;
  TSDL_RWops = record
    seek: TSeek;
    read: TRead;
    write: TWrite;
    close: TClose;
    type_: UInt32;
    case Integer of
      0: (stdio: TStdio);
      1: (mem: TMem);
      2: (unknown: TUnknown)
  end;

  TSDL_TimerCallback = function(interval: UInt32): UInt32;
  TSDL_NewTimerCallback = function(interval: UInt32;
    param: Pointer): UInt32;

  PSDL_TimerID = ^TSDL_TimerID;
  TSDL_TimerID = record
    interval: UInt32;
    callback: TSDL_NewTimerCallback;
    param: Pointer;
    last_alarm: UInt32;
    next: PSDL_TimerID;
  end;

  TSDL_AudioSpecCallback = procedure(userdata: Pointer; stream: PUInt8;
    len: CInteger);

  PSDL_AudioSpec = ^TSDL_AudioSpec;
  TSDL_AudioSpec = record
    freq: CInteger;
    format: UInt16;
    channels: UInt8;
    silence: UInt8;
    samples: UInt16;
    padding: UInt16;
    size: UInt32;
    callback: TSDL_AudioSpecCallback;
    userdata: Pointer;
  end;

  PSDL_AudioCVT = ^TSDL_AudioCVT;
  PSDL_AudioCVTFilter = ^TSDL_AudioCVTFilter;
  TSDL_AudioCVTFilter = record
    cvt: PSDL_AudioCVT;
    format: UInt16;
  end;
  PSDL_AudioCVTFilterArray = ^TSDL_AudioCVTFilterArray;
  TSDL_AudioCVTFilterArray = array [0..9] of PSDL_AudioCVTFilter;
  TSDL_AudioCVT = record
    needed: CInteger;
    src_format: UInt16;
    dst_format: UInt16;
    rate_incr: Double;
    buf: PUInt8;
    len: CInteger;
    len_cvt: CInteger;
    len_mult: CInteger;
    len_ratio: Double;
    filters: TSDL_AudioCVTFilterArray;
    filter_index: CInteger;
  end;

  TSDL_AudioStatus = (
    SDL_AUDIO_STOPPED,
    SDL_AUDIO_PLAYING,
    SDL_AUDIO_PAUSED
  );

  TSDL_CDStatus = (
    CD_ERROR,
    CD_TRAYEMPTY,
    CD_Stopped,
    CD_Playing,
    CD_Paused
  );

  PSDLL_CDTrack = ^TSDL_CDTrack;
  TSDL_CDTrack = record
    id: UInt8;
    type_: UInt8;
    unused: UInt16;
    length: UInt32;
    offset: UInt32;
  end;

  PSDL_CD = ^TSDL_CD;
  TSDL_CD = record
    id: CInteger;
    status: TSDL_CDStatus;
    numtracks: CInteger;
    cur_track: CInteger;
    cur_frame: CInteger;
    track: array [0..SDL_MAX_TRACKS] of TSDL_CDTrack;
  end;

  PTransAxis = ^TTransAxis;
  TTransAxis = record
    offset: CInteger;
    scale: Single;
  end;

  PJoystick_hwdata = ^TJoystick_hwdata;
  TJoystick_hwdata = record
    id: CInteger;
    transaxis: array [0..5] of TTransAxis;
  end;

  PBallDelta = ^TBallDelta;
  TBallDelta = record
    dx: CInteger;
    dy: CInteger;
  end;

  PSDL_Joystick = ^TSDL_Joystick;
  TSDL_Joystick = record
    index: UInt8;
    name: CString;
    naxes: CInteger;
    axis: PUInt16;
    nhats: CInteger;
    hats: PUInt8;
    nballs: CInteger;
    balls: PBallDelta;

    nbuttons: CInteger;
    buttons: PUInt8;
    hwdata: PJoystick_hwdata;
    ref_count: CInteger;
  end;

  PSDL_Version = ^TSDL_Version;
  TSDL_Version = record
    major: UInt8;
    minor: UInt8;
    patch: UInt8;
  end;

  TSDLKey = LongInt;
  TSDLMod = LongWord;

  PSDL_KeySym = ^TSDL_KeySym;
  TSDL_KeySym = record
    scancode: UInt8;
    sym: TSDLKey;
    modifier: TSDLMod;
    unicode: UInt16;
  end;

  TSDL_EventAction = (SDL_ADDEVENT, SDL_PEEKEVENT, SDL_GETEVENT);

  TSDL_ActiveEvent = record
    type_: UInt8;
    gain: UInt8;
    state: UInt8;
  end;

  TSDL_KeyboardEvent = record
    type_: UInt8;
    which: UInt8;
    state: UInt8;
    keysym: TSDL_KeySym;
  end;

  TSDL_MouseMotionEvent = record
    type_: UInt8;
    which: UInt8;
    state: UInt8;
    x, y: UInt16;
    xrel: SInt16;
    yrel: SInt16;
  end;

  TSDL_MouseButtonEvent = record
    type_: UInt8;
    which: UInt8;
    button: UInt8;
    state: UInt8;
    x: UInt16;
    y: UInt16;
  end;

  TSDL_JoyAxisEvent = record
    type_: UInt8;
    which: UInt8;
    axis: UInt8;
    value: SInt16;
  end;

  TSDL_JoyBallEvent = record
    type_: UInt8;
    which: UInt8;
    ball: UInt8;
    xrel: SInt16;
    yrel: SInt16;
  end;

  TSDL_JoyHatEvent = record
    type_: UInt8;
    which: UInt8;
    hat: UInt8;
    value: UInt8;
  end;

  TSDL_JoyButtonEvent = record
    type_: UInt8;
    which: UInt8;
    button: UInt8;
    state: UInt8;
  end;

  TSDL_ResizeEvent = record
    type_: UInt8;
    w: CInteger;
    h: CInteger;
  end;

  PSDL_QuitEvent = ^TSDL_QuitEvent;
  TSDL_QuitEvent = record
    type_: UInt8;
  end;

  PSDL_UserEvent = ^TSDL_UserEvent;
  TSDL_UserEvent = record
    type_: UInt8;
    code: CInteger;
    data1: Pointer;
    data2: Pointer;
  end;

  PSDL_ExposeEvent = ^TSDL_ExposeEvent;
  TSDL_ExposeEvent = record
    type_: UInt8;
  end;

  {$IFDEF __unix__}
  TSDL_SysWm = (SDL_SYSWM_X11);
  {$ENDIF}

  {$IFDEF __WINDOWS__}
  PSDL_SysWMmsg = ^TSDL_SysWMmsg;
  TSDL_SysWMmsg = record
    version: TSDL_Version;
    h_wnd: HWND;
    msg: UInt;
    w_Param: WPARAM;
    lParam: LPARAM;
  end;
  {$ELSE}
  {$IFDEF __unix__}
  PSDL_SysWMmsg = ^TSDL_SysWMmsg;
  TSDL_SysWMmsg = record
    version: TSDL_Version;
    subsystem: TSDL_SysWm;
    event: XEvent;
  end;
  {$ELSE}
  PSDL_SysWMmsg = ^TSDL_SysWMmsg;
  TSDL_SysWMmsg = record
    version: TSDL_Version;
    data: CInteger;
  end;
  {$ENDIF}
  {$ENDIF}

  {$IFDEF __WINDOWS__}
  PSDL_SysWMinfo = ^TSDL_SysWMinfo;
  TSDL_SysWMinfo = record
    version: TSDL_Version;
    window: HWnd;
  end;
  {$ELSE}
  {$IFDEF __unix__}
  TX11 = record
    display: PDisplay;
    window: TWindow;
    lock_func: Pointer;
    unlock_func: Pointer;
    fswindow: TWindow;
    wmwindow: TWindow;
  end;
  
  PSDL_SysWMinfo = ^TSDL_SysWMinfo;
  TSDL_SysWMinfo = record
    version: TSDL_Version;
    subsystem: TSDL_SysWm;
    X11: TX11;
  end;
  {$ELSE}
    PSDL_SysWMinfo = ^TSDL_SysWMinfo;
    TSDL_SysWMinfo = record
      version: TSDL_Version;
      data: CInteger;
    end;
  {$ENDIF}
  {$ENDIF}

  PSDL_SysWMEvent = ^TSDL_SysWMEvent;
  TSDL_SysWMEvent = record
    type_: UInt8;
    msg: PSDL_SysWMmsg;
  end;

  PSDL_Event = ^TSDL_Event;
  TSDL_Event = record
    case UInt8 of
      SDL_NOEVENT: (type_: Byte);
      SDL_ACTIVEEVENT: (active: TSDL_ActiveEvent);
      SDL_KEYDOWN, SDL_KEYUP: (key: TSDL_KeyboardEvent);
      SDL_MOUSEMOTION: (motion: TSDL_MouseMotionEvent);
      SDL_MOUSEBUTTONDOWN, SDL_MOUSEBUTTONUP:
        (button: TSDL_MouseButtonEvent);
      SDL_JOYAXISMOTION: (jaxis: TSDL_JoyAxisEvent);
      SDL_JOYBALLMOTION: (jball: TSDL_JoyBallEvent);
      SDL_JOYHATMOTION: (jhat: TSDL_JoyHatEvent);
      SDL_JOYBUTTONDOWN, SDL_JOYBUTTONUP: (jbutton: TSDL_JoyButtonEvent);
      SDL_VIDEORESIZE: (resize: TSDL_ResizeEvent);
      SDL_QUITEV: (quit: TSDL_QuitEvent);
      SDL_USEREVENT : (user : TSDL_UserEvent);
      SDL_SYSWMEVENT: (syswm: TSDL_SysWMEvent);
  end;

  TSDL_EventFilter = function(event: PSDL_Event): CInteger;

  PPSDL_Rect = ^PSDL_Rect;
  PSDL_Rect = ^TSDL_Rect;
  TSDL_Rect = record
    x, y: Sint16;
    w, h: UInt16;
  end;

  PSDL_Color = ^TSDL_Color;
  TSDL_Color = record
    r, g, b, unused: UInt8;
  end;

  PSDL_ColorArray = ^TSDL_ColorArray;
  TSDL_ColorArray = array [0..65000] of TSDL_Color;

  PSDL_Palette = ^TSDL_Palette;
  TSDL_Palette = record
    ncolors: Integer;
    colors: PSDL_ColorArray;
  end;

  PSDL_PixelFormat = ^TSDL_PixelFormat;
  TSDL_PixelFormat = record
    palette: PSDL_Palette;
    BitsPerPixel: UInt8;
    BytesPerPixel: UInt8;
    Rloss: UInt8;
    Gloss: UInt8;
    Bloss: UInt8;
    Aloss: UInt8;
    Rshift: UInt8;
    Gshift: UInt8;
    Bshift: UInt8;
    Ashift: UInt8;
    RMask: UInt32;
    GMask: UInt32;
    BMask: UInt32;
    AMask: UInt32;
    colorkey: UInt32; // RGB color key information
    alpha: UInt8; // Alpha value information (per-surface alpha)
  end;

  PSDL_BlitInfo = ^TSDL_BlitInfo;
  TSDL_BlitInfo = record
    s_pixels: PUInt8;
    s_width: CInteger;
    s_height: CInteger;
    s_skip: CInteger;
    d_pixels: PUInt8;
    d_width: CInteger;
    d_height: CInteger;
    d_skip: CInteger;
    aux_data: Pointer;
    src: PSDL_PixelFormat;
    table: PUInt8;
    dst: PSDL_PixelFormat;
  end;

  PSDL_Surface = ^TSDL_Surface;
  TSDL_Surface = record
    flags: UInt32;
    format: PSDL_PixelFormat;
    w, h: CInteger;
    pitch: UInt16;
    pixels: Pointer;
    offset: CInteger;
    hwdata: Pointer;
    clip_rect: TSDL_Rect;
    unused1: UInt32;
    locked: UInt32;
    blitmap: pointer;
    format_version: Cardinal;
    refcount: CInteger;
  end;

  TSDL_Blit = function(src: PSDL_Surface; srcrect: PSDL_Rect;
    dst: PSDL_Surface; dstrect: PSDL_Rect): CInteger;

  PSDL_VideoInfo = ^TSDL_VideoInfo;
  TSDL_VideoInfo = record
    hw_available: UInt8;
    blit_hw: UInt8;
    UnusedBits3: UInt8;
    video_mem: UInt32;
    vfmt: PSDL_PixelFormat;
    current_w: SInt32;
    current_h: SInt32;
  end;

  PSDL_Overlay = ^TSDL_Overlay;
  TSDL_Overlay = record
    format: UInt32;
    w, h: CInteger;
    planes: CInteger;
    pitches: PUInt16;
    pixels: PPUInt8;
    hw_overlay: UInt32;
  end;

  TSDL_GLAttr = (
    SDL_GL_RED_SIZE,
    SDL_GL_GREEN_SIZE,
    SDL_GL_BLUE_SIZE,
    SDL_GL_ALPHA_SIZE,
    SDL_GL_BUFFER_SIZE,
    SDL_GL_DOUBLEBUFFER,
    SDL_GL_DEPTH_SIZE,
    SDL_GL_STENCIL_SIZE,
    SDL_GL_ACCUM_RED_SIZE,
    SDL_GL_ACCUM_GREEN_SIZE,
    SDL_GL_ACCUM_BLUE_SIZE,
    SDL_GL_ACCUM_ALPHA_SIZE,
    SDL_GL_STEREO,
    SDL_GL_MULTISAMPLEBUFFERS,
    SDL_GL_MULTISAMPLESAMPLES,
    SDL_GL_ACCELERATED_VISUAL,
    SDL_GL_SWAP_CONTROL
  );

  PSDL_Cursor = ^TSDL_Cursor;
  TSDL_Cursor = record
    area: TSDL_Rect;
    hot_x, hot_y: SInt16;
    data: PUInt8;
    mask: PUInt8;
    save: array [1..2] of PUInt8;
    wm_cursor: Pointer;
  end;

  _pthread_fastlock = record
    __status: MedInt;
    __spinlock: CInteger;
  end;

  pthread_mutex_t = record
    __m_reserved: CInteger;
    __m_count: CInteger;
    __m_owner: Pointer;
    __m_kind: CInteger;
    __m_lock: _pthread_fastlock;
  end;

  pthread_t = Cardinal;

  {$IFDEF __WINDOWS__}
  PSDL_Mutex = ^TSDL_Mutex;
  TSDL_Mutex = record
    id: THANDLE;
  end;
  {$ENDIF}

  {$IFDEF __unix__}
  PSDL_Mutex = ^TSDL_Mutex;
  TSDL_Mutex = record
    id: pthread_mutex_t;
  end;
  {$ENDIF}

  {$IFDEF __MACH__}
  PSDL_Mutex = ^TSDL_Mutex;
  TSDL_Mutex = record
    id: pthread_mutex_t;
  end;
  {$ENDIF}

  PSDL_semaphore = ^TSDL_semaphore;
  {$IFDEF __WINDOWS__}
  TSDL_semaphore = record
    id: THANDLE;
    count: UInt32;
  end;
  {$ELSE}
  TSDL_semaphore = record
    sem: Pointer;
  end;
  {$ENDIF}

  PSDL_Sem = ^TSDL_Sem;
  TSDL_Sem = TSDL_semaphore;

  PSDL_Cond = ^TSDL_Cond;
  TSDL_Cond = record
    {$IFDEF __unix__}
    cond: pthread_mutex_t;
    {$ELSE}
    lock: PSDL_mutex;
    waiting: CInteger;
    signals: CInteger;
    wait_sem: PSDL_Sem;
    wait_done: PSDL_Sem;
    {$ENDIF}
  end;

  {$IFDEF __WINDOWS__}
  TSYS_ThreadHandle = THandle;
  {$ENDIF}

  {$IFDEF __unix__}
  TSYS_ThreadHandle = pthread_t;
  {$ENDIF}

  {$IFDEF __MACH__}
  TSYS_ThreadHandle = pthread_t;
  {$ENDIF}

  PSDL_Thread = ^TSDL_Thread;
  TSDL_Thread = record
    threadid: UInt32;
    handle: TSYS_ThreadHandle;
    status: CInteger;
    errbuf: TSDL_Error;
    data: Pointer;
  end;

  PKeyStateArr = ^TKeyStateArr;
  TKeyStateArr = array [0..65000] of UInt8;

  PInteger = ^CInteger;
  PByte = ^Byte;
  PWord = ^Word;
  PLongWord = ^LongWord;

  PByteArray = ^TByteArray;
  TByteArray = array [0..32767] of Byte;

  PWordArray = ^TWordArray;
  TWordArray = array [0..16383] of Word;

  TProcedure = procedure;

{-------------------------------------------------------------------------}
{ Initialization                                                          }
{-------------------------------------------------------------------------}

function SDL_Init(flags: UInt32): CInteger; external name 'SDL_Init';

function SDL_InitSubSystem(flags: UInt32): CInteger;
  external name 'SDL_InitSubSystem';

procedure SDL_QuitSubSystem(flags: UInt32);
  external name 'SDL_QuitSubSystem';

function SDL_WasInit(flags: UInt32): UInt32; external name 'SDL_WasInit';

procedure SDL_Quit; external name 'SDL_Quit';

{$IFDEF __WINDOWS__}
function SDL_RegisterApp(name: CString; style: UInt32;
  h_Inst: Pointer): CInteger; external name 'SDL_RegisterApp';
{$ENDIF}

(*{$IFDEF __MACH__}
procedure SDL_InitQuickDraw(the_qd: QDGlobals);
  external name 'SDL_InitQuickDraw';
{$ENDIF}*)

{-------------------------------------------------------------------------}
{ Error handling                                                          }
{-------------------------------------------------------------------------}

function SDL_GetError: CString; external name 'SDL_GetError';

procedure SDL_SetError(fmt: CString); external name 'SDL_SetError';

procedure SDL_ClearError; external name 'SDL_ClearError';

{$IFNDEF __WINDOWS__}
procedure SDL_Error(code: TSDL_errorcode); external name 'SDL_Error';
{$ENDIF}

{-------------------------------------------------------------------------}
{ IO handling                                                             }
{-------------------------------------------------------------------------}

function SDL_RWFromFile(filename, mode: CString): PSDL_RWops;
  external name 'SDL_RWFromFile';

procedure SDL_FreeRW(area: PSDL_RWops); external name 'SDL_FreeRW';

function SDL_RWFromFP(fp: Pointer; autoclose: CInteger): PSDL_RWops;
  external name 'SDL_RWFromFP';

function SDL_RWFromMem(mem: Pointer; size: CInteger): PSDL_RWops;
  external name 'SDL_RWFromMem';

function SDL_RWFromConstMem(const mem: Pointer;
  size: CInteger): PSDL_RWops; external name 'SDL_RWFromConstMem';

function SDL_AllocRW: PSDL_RWops; external name 'SDL_AllocRW';

{-------------------------------------------------------------------------}
{ Time handling                                                           }
{-------------------------------------------------------------------------}

function SDL_GetTicks: UInt32; external name 'SDL_GetTicks';

procedure SDL_Delay(ms: UInt32); external name 'SDL_Delay';

function SDL_AddTimer(interval: UInt32; callback: TSDL_NewTimerCallback;
  param: Pointer): PSDL_TimerID; external name 'SDL_AddTimer';

function SDL_RemoveTimer(t: PSDL_TimerID): TSDL_Bool;
  external name 'SDL_RemoveTimer';

function SDL_SetTimer(interval: UInt32;
  callback: TSDL_TimerCallback): CInteger; external name 'SDL_SetTimer';

{-------------------------------------------------------------------------}
{ Audio routines                                                          }
{-------------------------------------------------------------------------}

function SDL_AudioInit(driver_name: CString): CInteger;
  external name 'SDL_AudioInit';

procedure SDL_AudioQuit; external name 'SDL_AudioQuit';

function SDL_AudioDriverName(namebuf: CString; maxlen: CInteger): CString;
  external name 'SDL_AudioDriverName';

function SDL_OpenAudio(desired, obtained: PSDL_AudioSpec): CInteger;
  external name 'SDL_OpenAudio';

function SDL_GetAudioStatus: TSDL_AudioStatus;
  external name 'SDL_GetAudioStatus';

procedure SDL_PauseAudio(pause_on: CInteger);
  external name 'SDL_PauseAudio';

function SDL_LoadWAV_RW(src: PSDL_RWops; freesrc: CInteger;
  spec: PSDL_AudioSpec; audio_buf: PUInt8;
  audiolen: PUInt32): PSDL_AudioSpec; external name 'SDL_LoadWAV_RW';

procedure SDL_FreeWAV(audio_buf: PUInt8); external name 'SDL_FreeWAV';

function SDL_BuildAudioCVT(cvt: PSDL_AudioCVT; src_format: UInt16;
  src_channels: UInt8; src_rate: CInteger; dst_format: UInt16;
  dst_channels: UInt8; dst_rate: CInteger): CInteger;
  external name 'SDL_BuildAudioCVT';

function SDL_ConvertAudio(cvt: PSDL_AudioCVT): CInteger;
  external name 'SDL_ConvertAudio';

procedure SDL_MixAudio(dst, src: PUInt8; len: UInt32; volume: CInteger);
  external name 'SDL_MixAudio';

procedure SDL_LockAudio; external name 'SDL_LockAudio';

procedure SDL_UnlockAudio; external name 'SDL_UnlockAudio';

procedure SDL_CloseAudio; external name 'SDL_CloseAudio';

{-------------------------------------------------------------------------}
{ CD routines                                                             }
{-------------------------------------------------------------------------}

function SDL_CDNumDrives: CInteger; external name 'SDL_CDNumDrives';

function SDL_CDName(drive: CInteger): CString; external name 'SDL_CDName';

function SDL_CDOpen(drive: CInteger): PSDL_CD; external name 'SDL_CDOpen';

function SDL_CDStatus(cdrom: PSDL_CD): TSDL_CDStatus;
  external name 'SDL_CDStatus';

function SDL_CDPlayTracks(cdrom: PSDL_CD; start_track: CInteger;
  start_frame: CInteger; ntracks: CInteger; nframes: CInteger): CInteger;
  external name 'SDL_CDPlayTracks';

function SDL_CDPlay(cdrom: PSDL_CD; start: CInteger;
  length: CInteger): CInteger; external name 'SDL_CDPlay';

function SDL_CDPause(cdrom: PSDL_CD): CInteger;
  external name 'SDL_CDPause';

function SDL_CDResume(cdrom: PSDL_CD): CInteger;
  external name 'SDL_CDPause';

function SDL_CDStop(cdrom: PSDL_CD): CInteger; external name 'SDL_CDStop';

function SDL_CDEject(cdrom: PSDL_CD): CInteger;
  external name 'SDL_CDEject';

procedure SDL_CDClose(cdrom: PSDL_CD); external name 'SDL_CDClose';

{-------------------------------------------------------------------------}
{ Joystick routines                                                       }
{-------------------------------------------------------------------------}

function SDL_NumJoysticks: CInteger; external name 'SDL_NumJoysticks';

function SDL_JoystickName(index: CInteger): CString;
  external name 'SDL_JoystickName';

function SDL_JoystickOpen(index: CInteger): PSDL_Joystick;
  external name 'SDL_JoystickOpen';

function SDL_JoystickOpened(index: CInteger): CInteger;
  external name 'SDL_JoystickOpened';

function SDL_JoystickIndex(joystick: PSDL_Joystick): CInteger;
  external name 'SDL_JoystickIndex';

function SDL_JoystickNumAxes(joystick: PSDL_Joystick): CInteger;
  external name 'SDL_JoystickNumAxes';

function SDL_JoystickNumBalls(joystick: PSDL_Joystick): CInteger;
  external name 'SDL_JoystickNumBalls';

function SDL_JoystickNumHats(joystick: PSDL_Joystick): CInteger;
  external name 'SDL_JoystickNumHats';

function SDL_JoystickNumButtons(joystick: PSDL_Joystick): CInteger;
  external name 'SDL_JoystickNumButtons';

procedure SDL_JoystickUpdate; external name 'SDL_JoystickUpdate';

function SDL_JoystickEventState(state: CInteger): CInteger;
  external name 'SDL_JoystickEventState';

function SDL_JoystickGetAxis(joystick: PSDL_Joystick;
  axis: CInteger): SInt16; external name 'SDL_JoystickGetAxis';

function SDL_JoystickGetHat(joystick: PSDL_Joystick;
  hat: CInteger): UInt8; external name 'SDL_JoystickGetHat';

function SDL_JoystickGetBall(joystick: PSDL_Joystick; ball: CInteger;
  var dx: CInteger; var dy: CInteger): CInteger;
  external name 'SDL_JoystickGetBall';

function SDL_JoystickGetButton(joystick: PSDL_Joystick;
  button: CInteger): UInt8; external name 'SDL_JoystickGetButton';

procedure SDL_JoystickClose(joystick: PSDL_Joystick);
  external name 'SDL_JoystickClose';

{-------------------------------------------------------------------------}
{ Event handling                                                          }
{-------------------------------------------------------------------------}

procedure SDL_PumpEvents; external name 'SDL_PumpEvents';

function SDL_PeepEvents(events: PSDL_Event; numevents: CInteger;
  action: TSDL_EventAction; mask: UInt32): CInteger;
  external name 'SDL_PeepEvents';

function SDL_PollEvent(event: PSDL_Event): CInteger;
  external name 'SDL_PollEvent';

function SDL_WaitEvent(event: PSDL_Event): CInteger;
  external name 'SDL_WaitEvent';

function SDL_PushEvent(event: PSDL_Event): CInteger;
  external name 'SDL_PushEvent';

procedure SDL_SetEventFilter(filter: TSDL_EventFilter);
  external name 'SDL_SetEventFilter';

(* function SDL_GetEventFilter: TSDL_EventFilter;
  external name 'SDL_GetEventFilter'; *)

function SDL_EventState(type_: UInt8; state: CInteger): UInt8;
  external name 'SDL_EventState';

{-------------------------------------------------------------------------}
{ Version routines                                                        }
{-------------------------------------------------------------------------}

function SDL_Linked_Version: PSDL_version;
  external name 'SDL_Linked_Version';

{-------------------------------------------------------------------------}
{ Video                                                                   }
{-------------------------------------------------------------------------}

function SDL_VideoInit(driver_name: CString; flags: UInt32): CInteger;
  external name 'SDL_VideoInit';

procedure SDL_VideoQuit; external name 'SDL_VideoQuit';

function SDL_VideoDriverName(namebuf: CString;
  maxlen: CInteger): CString; external name 'SDL_VideoDriverName';

function SDL_GetVideoSurface: PSDL_Surface;
  external name 'SDL_GetVideoSurface';

function SDL_GetVideoInfo: PSDL_VideoInfo;
  external name 'SDL_GetVideoInfo';

function SDL_VideoModeOK(width, height, bpp: CInteger;
  flags: UInt32): CInteger; external name 'SDL_VideoModeOK';

function SDL_ListModes(format: PSDL_PixelFormat;
  flags: UInt32): PPSDL_Rect; external name 'SDL_ListModes';

function SDL_SetVideoMode(width, height, bpp: CInteger;
  flags: UInt32): PSDL_Surface; external name 'SDL_SetVideoMode';

procedure SDL_UpdateRects(screen: PSDL_Surface; numrects: CInteger;
  rects: PSDL_Rect); external name 'SDL_UpdateRects';

procedure SDL_UpdateRect(screen: PSDL_Surface; x, y: SInt32;
  w, h: UInt32); external name 'SDL_UpdateRect';

function SDL_Flip(screen: PSDL_Surface): CInteger;
  external name 'SDL_Flip';

function SDL_SetGamma(redgamma, greengamma, bluegamma: Single): CInteger;
  external name 'SDL_SetGamma';

function SDL_SetGammaRamp(redtable, greentable,
  bluetable: PUInt16): CInteger; external name 'SDL_SetGammaRamp';

function SDL_GetGammaRamp(redtable, greentable,
  bluetable: PUInt16): CInteger; external name 'SDL_GetGammaRamp';

function SDL_SetColors(surface: PSDL_Surface; colors: PSDL_Color;
  firstcolor, ncolors: CInteger): CInteger; external name 'SDL_SetColors';

function SDL_SetPalette(surface: PSDL_Surface; flags: CInteger;
  colors: PSDL_Color; firstcolor, ncolors: CInteger): CInteger;
  external name 'SDL_SetPalette';

function SDL_MapRGB(fmt: PSDL_PixelFormat; r, g, b: UInt8): UInt32;
  external name 'SDL_MapRGB';

function SDL_MapRGBA(fmt: PSDL_PixelFormat; r, g, b, a: UInt8): UInt32;
  external name 'SDL_MapRGBA';

procedure SDL_GetRGB(pixel: UInt32; fmt: PSDL_PixelFormat;
  r, g, b: PUInt8); external name 'SDL_GetRGB';

procedure SDL_GetRGBA(pixel: UInt32; fmt: PSDL_PixelFormat;
  r, g, b, a: PUInt8); external name 'SDL_GetRGB';

function SDL_CreateRGBSurface(flags: UInt32; w, h, d: CInteger;
  r, g, b, a: UInt32): PSDL_Surface; external name 'SDL_CreateRGBSurface';

function SDL_CreateRGBSurfaceFrom(pixels: Pointer; w, h, d, p: CInteger;
  r, g, b, a: UInt32): PSDL_Surface;
  external name 'SDL_CreateRGBSurfaceFrom';

procedure SDL_FreeSurface(surface: PSDL_Surface);
  external name 'SDL_FreeSurface';

function SDL_LockSurface(surface: PSDL_Surface): CInteger;
  external name 'SDL_LockSurface';

procedure SDL_UnlockSurface(surface: PSDL_Surface);
  external name 'SDL_UnlockSurface';

function SDL_LoadBMP_RW(src: PSDL_RWops; freesrc: CInteger): PSDL_Surface;
  external name 'SDL_LoadBMP_RW';

function SDL_SaveBMP_RW(surface: PSDL_Surface; dst: PSDL_RWops;
  freedst: CInteger): CInteger; external name 'SDL_SaveBMP_RW';

function SDL_SetColorKey(surface: PSDL_Surface;
  flag, key: UInt32): CInteger; external name 'SDL_SetColorKey';

function SDL_SetAlpha(surface: PSDL_Surface; flag: Uint32;
  alpha: UInt8): CInteger; external name 'SDL_SetAlpha';

function SDL_BlitSurface(src: PSDL_Surface; const srcrect: PSDL_Rect;
  dst: PSDL_Surface; dstrect: PSDL_Rect): CInteger;
  external name 'SDL_BlitSurface';

function SDL_FillRect(dst: PSDL_Surface; const rect: PSDL_Rect;
  color: UInt32): CInteger; external name 'SDL_FillRect';

end;

end.
