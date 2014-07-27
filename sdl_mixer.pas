module SDL_mixer;

{$L SDL_mixer}

export SDL_mixer = all;

import
  SDL;

const
  SDL_MIXER_MAJOR_VERSION = 1;
  SDL_MIXER_MINOR_VERSION = 2;
  SDL_MIXER_PATCH_LEVEL = 7;

  MIX_CHANNELS = 8;
  MIX_DEFAULT_FREQUENCY = 22050;

  {$IFDEF i386}
  MIX_DEFAULT_FORMAT = AUDIO_S16LSB;
  {$ELSE}
  MIX_DEFAULT_FORMAT = AUDIO_S16MSB;
  {$ENDIF}

  MIX_DEFAULT_CHANNELS = 2;

  MIX_MAX_VOLUME = 128;

  PATH_MAX = 255;

  LIBMIKMOD_VERSION_MAJOR = 3;
  LIBMIKMOD_VERSION_MINOR = 1;
  LIBMIKMOD_REVISION = 8;
  LIBMIKMOD_VERSION = ((LIBMIKMOD_VERSION_MAJOR shl 16) or
    (LIBMIKMOD_VERSION_MINOR shl 8) or (LIBMIKMOD_REVISION));

type
  PMusicCMD = ^TMusicCMD;
  TMusicCMD = record
    filename: array [0..PATH_MAX - 1] of char;
    cmd: array [0..PATH_MAX - 1] of char;
    pid: TSYS_ThreadHandle;
  end;

  PWAVStream = ^TWAVStream;
  TWAVStream = record
    rw: PSDL_RWops;
    freerw: TSDL_Bool;
    start: MedInt;
    stop: MedInt;
    cvt: TSDL_AudioCVT;
  end;

  PMidiEvent = ^TMidiEvent;
  TMidiEvent = record
    time: MedInt;
    channel: Uint8;
    type_: Uint8;
    a: Uint8;
    b: Uint8;
  end;

  PMidiSong = ^TMidiSong;
  TMidiSong = record
    samples: MedInt;
    events: PMidiEvent;
  end;

  POGG_Music = ^TOGG_Music;
  TOGG_Music = record
    playing: CInteger;
    volume: CInteger;
    section: CInteger;
    cvt: TSDL_AudioCVT;
    len_available: CInteger;
    snd_available: PUint8;
  end;

  TErrorEnum = (
    MMERR_OPENING_FILE,
    MMERR_OUT_OF_MEMORY,
    MMERR_DYNAMIC_LINKING,
    MMERR_SAMPLE_TOO_BIG,
    MMERR_OUT_OF_HANDLES,
    MMERR_UNKNOWN_WAVE_TYPE,
    MMERR_LOADING_PATTERN,
    MMERR_LOADING_TRACK,
    MMERR_LOADING_HEADER,
    MMERR_LOADING_SAMPLEINFO,
    MMERR_NOT_A_MODULE,
    MMERR_NOT_A_STREAM,
    MMERR_MED_SYNTHSAMPLES,
    MMERR_ITPACK_INVALID_DATA,
    MMERR_DETECTING_DEVICE,
    MMERR_INVALID_DEVICE,
    MMERR_INITIALIZING_MIXER,
    MMERR_OPENING_AUDIO,
    MMERR_8BIT_ONLY,
    MMERR_16BIT_ONLY,
    MMERR_STEREO_ONLY,
    MMERR_ULAW,
    MMERR_NON_BLOCK,
    MMERR_AF_AUDIO_PORT,
    MMERR_AIX_CONFIG_INIT,
    MMERR_AIX_CONFIG_CONTROL,
    MMERR_AIX_CONFIG_START,
    MMERR_GUS_SETTINGS,
    MMERR_GUS_RESET,
    MMERR_GUS_TIMER,
    MMERR_HP_SETSAMPLESIZE,
    MMERR_HP_SETSPEED,
    MMERR_HP_CHANNELS,
    MMERR_HP_AUDIO_OUTPUT,
    MMERR_HP_AUDIO_DESC,
    MMERR_HP_BUFFERSIZE,
    MMERR_OSS_SETFRAGMENT,
    MMERR_OSS_SETSAMPLESIZE,
    MMERR_OSS_SETSTEREO,
    MMERR_OSS_SETSPEED,
    MMERR_SGI_SPEED,
    MMERR_SGI_16BIT,
    MMERR_SGI_8BIT,
    MMERR_SGI_STEREO,
    MMERR_SGI_MONO,
    MMERR_SUN_INIT,
    MMERR_OS2_MIXSETUP,
    MMERR_OS2_SEMAPHORE,
    MMERR_OS2_TIMER,
    MMERR_OS2_THREAD,
    MMERR_DS_PRIORITY,
    MMERR_DS_BUFFER,
    MMERR_DS_FORMAT,
    MMERR_DS_NOTIFY,
    MMERR_DS_EVENT,
    MMERR_DS_THREAD,
    MMERR_DS_UPDATE,
    MMERR_WINMM_HANDLE,
    MMERR_WINMM_ALLOCATED,
    MMERR_WINMM_DEVICEID,
    MMERR_WINMM_FORMAT,
    MMERR_WINMM_UNKNOWN,
    MMERR_MAC_SPEED,
    MMERR_MAC_START,
    MMERR_MAX
  );

  PMODULE = ^TMODULE;
  TMODULE = record
  end;

  PUNIMOD = ^TUNIMOD;
  TUNIMOD = TMODULE;

  PMix_Chunk = ^TMix_Chunk;
  TMix_Chunk = record
    allocated: CInteger;
    abuf: PUint8;
    alen: Uint32;
    volume: Uint8;
  end;

  TMix_Fading = (
    MIX_NO_FADING,
    MIX_FADING_OUT,
    MIX_FADING_IN
  );

  TMix_MusicType = (
    MUS_NONE,
    MUS_CMD,
    MUS_WAV,
    MUS_MOD,
    MUS_MID,
    MUS_OGG,
    MUS_MP3
  );

  TMusicUnion = record
    case Byte of
      0: (cmd: PMusicCMD);
      1: (wave: PWAVStream);
      2: (module: PUNIMOD);
      3: (midi: TMidiSong);
      4: (ogg: POGG_music);
      {$IFNDEF __MACH__}
      5: (mp3: PSMPEG);
      {$ENDIF}
  end;

  PMix_Music = ^TMix_Music;
  TMix_Music = record
    type_: TMix_MusicType;
    data: TMusicUnion;
    fading: TMix_Fading;
    fade_volume: CInteger;
    fade_step: CInteger;
    fade_steps: CInteger;
    error: CInteger;
  end;

  TMixFunction = function(udata: Pointer; stream: PUint8;
    len: CInteger): Pointer;

function Mix_Linked_Version: PSDL_Version;
  external name 'Mix_Linked_Version';

function Mix_OpenAudio(frequency: CInteger; format: Uint16;
  channels: CInteger; chunksize: CInteger): CInteger;
  external name 'Mix_OpenAudio';

function Mix_AllocateChannels(numchannels: CInteger): CInteger;
  external name 'Mix_AllocateChannels';

function Mix_QuerySpec(var frequency: CInteger; var format: Uint16;
  var channels: CInteger): CInteger; external name 'Mix_QuerySpec';

function Mix_LoadWAV_RW(src: PSDL_RWops; freesrc: CInteger): PMix_Chunk;
  external name 'Mix_LoadWAV_RW';

function Mix_LoadMUS(const filename: CString): PMix_Music;
  external name 'Mix_LoadMUS';

function Mix_QuickLoad_WAV(mem: PUint8): PMix_Chunk;
  external name 'Mix_QuickLoad_WAV';

procedure Mix_FreeChunk(chunk: PMix_Chunk); external name 'Mix_FreeChunk';

procedure Mix_FreeMusic(music: PMix_Music); external name 'Mix_FreeMusic';

function Mix_GetMusicType(music: PMix_Music): TMix_MusicType;
  external name 'Mix_GetMusicType';

procedure Mix_SetPostMix(mix_func: TMixFunction; arg: Pointer);
  external name 'Mix_SetPostMix';

procedure Mix_CloseAudio; external name 'Mix_CloseAudio';

procedure Mix_SetError(fmt: CString); external name 'Mix_SetError';

function Mix_GetError: CString; external name 'Mix_GetError';

function Mix_PlayMusic(music: PMix_Music; loops: CInteger): CInteger;
  external name 'Mix_PlayMusic';

function Mix_HaltMusic: CInteger; external name 'Mix_HaltMusic';

end;

end.
