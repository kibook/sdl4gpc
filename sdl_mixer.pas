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

  MIX_CHANNEL_POST = -2;

  MIX_EFFECTSMAXSPEED = 'MIX_EFFECTSMAXSPEED';

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

  TChannel_Finished = procedure(Channel: CInteger);

  TMix_EffectFunc = function(Chan: CInteger; Stream: Pointer;
    Len: CInteger; UData: Pointer): Pointer;

  TMix_EffectDone = function(Chan: CInteger; UData: Pointer): Pointer;

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

function Mix_LoadMUS_RW(rw: PSDL_RWops): PMix_Music;
  external name 'Mix_LoadMUS_RW';

function Mix_QuickLoad_WAV(mem: PUint8): PMix_Chunk;
  external name 'Mix_QuickLoad_WAV';

procedure Mix_FreeChunk(chunk: PMix_Chunk); external name 'Mix_FreeChunk';

procedure Mix_FreeMusic(music: PMix_Music); external name 'Mix_FreeMusic';

function Mix_GetMusicType(music: PMix_Music): TMix_MusicType;
  external name 'Mix_GetMusicType';

procedure Mix_SetPostMix(mix_func: TMixFunction; arg: Pointer);
  external name 'Mix_SetPostMix';

procedure Mix_HookMusic(Mix_Func: TMixFunction; Arg: Pointer);
  external name 'Mix_HookMusic';

procedure Mix_HookMusicFinished(Music_Finished: Pointer);
  external name 'Mix_HookMusicFinished';

function Mix_GetMusicHookData: Pointer;
  external name 'Mix_GetMusicHookData';

procedure Mix_ChannelFinished(Channel_Finished: TChannel_Finished);
  external name 'Mix_ChannelFinished';

function Mix_RegisterEffect(Chan: CInteger; f: TMix_EffectFunc;
  d: TMix_EffectDone; arg: Pointer): CInteger;
  external name 'Mix_RegisterEffect';

function Mix_UnregisterEffect(Chan: CInteger; f: TMix_EffectFunc): CInteger;
  external name 'Mix_UnregisterEffect';

function Mix_UnregisterAllEffects(Chan: CInteger): CInteger;
  external name 'Mix_UnregisterAllEffects';

function Mix_SetPanning(Chan: CInteger; Left, Right: UInt8): CInteger;
  external name 'Mix_SetPanning';

function Mix_SetPosition(Chan: CInteger; Angle: SInt16;
  Distance: UInt8): CInteger; external name 'Mix_SetPosition';

function Mix_SetDistance(Chan: CInteger; Distance: UInt8): CInteger;
  external name 'Mix_SetDistance';

function Mix_SetReverseStereo(Chan, Flip: CInteger): CInteger;
  external name 'Mix_SetReverseStereo';

function Mix_ReserveChannels(Num: CInteger): CInteger;
  external name 'Mix_ReserveChannels';

function Mix_GroupChannel(Which, Tag: CInteger): CInteger;
  external name 'Mix_GroupChannel';

function Mix_GroupChannels(From, To_, Tag: CInteger): CInteger;
  external name 'Mix_GroupChannels';

function Mix_GroupAvailable(Tag: CInteger): CInteger;
  external name 'Mix_GroupAvailable';

function Mix_GroupCount(Tag: CInteger): CInteger;
  external name 'Mix_GroupCount';

function Mix_GroupOldest(Tag: CInteger): CInteger;
  external name 'Mix_GroupOldest';

function Mix_GroupNewer(Tag: CInteger): CInteger;
  external name 'Mix_GroupNewer';

function Mix_PlayChannelTimed(Chan: CInteger; Chunk: PMix_Chunk;
  Loops, Ticks: CInteger): CInteger; external name 'Mix_PlayChannelTimed';

function Mix_PlayChannel(Chan: CInteger; Chunk: PMix_Chunk;
  Loops: CInteger): CInteger; external name 'Mix_PlayChannel';

function Mix_PlayMusic(music: PMix_Music; loops: CInteger): CInteger;
  external name 'Mix_PlayMusic';

function Mix_FadeInMusic(Music: PMix_Music; Loops, MS: CInteger): CInteger;
  external name 'Mix_FadeInMusic';

function Mix_FadeInChannelTimed(Chan: CInteger; Chunk: PMix_Chunk;
  Loops, MS, Ticks: CInteger): CInteger;
  external name 'Mix_FadeInChannelTimed';

function Mix_FadeInChannel(Chan: CInteger; Chunk: PMix_Chunk;
  Loops, MS: CInteger): CInteger; external name 'Mix_FadeInChannel';

function Mix_Volume(Chan: CInteger; Chunk: PMix_Chunk;
  Loops, MS: CInteger): CInteger; external name 'Mix_Volume';

function Mix_VolumeChunk(Chunk: PMix_Chunk; Volume: CInteger): CInteger;
  external name 'Mix_VolumeChunk';

function Mix_HaltChannel(Chan: CInteger): CInteger;
  external name 'Mix_HaltChannel';

function Mix_HaltGroup(Tag: CInteger): CInteger;
  external name 'Mix_HaltGroup';

function Mix_HaltMusic: CInteger; external name 'Mix_HaltMusic';

function Mix_ExpireChannel(Chan: CInteger; Ticks: CInteger): CInteger;
  external name 'Mix_ExpireChannel';

function Mix_FadeOutChannel(Which, MS: CInteger): CInteger;
  external name 'Mix_FadeOutChannel';

function Mix_FadeOutGroup(Tag, MS: CInteger): CInteger;
  external name 'Mix_FadeOutGroup';

function Mix_FadeOutMusic(MS: CInteger): CInteger;
  external name 'Mix_FadeOutMusic';

function Mix_FadingMusic: TMix_Fading; external name 'Mix_FadingMusic';

function Mix_FadingChannel(Which: CInteger): TMix_Fading;
  external name 'Mix_FadingChannel';

procedure Mix_Pause(Chan: CInteger); external name 'Mix_Pause';

procedure Mix_Resume(Chan: CInteger); external name 'Mix_Resume';

function Mix_Paused(Chan: CInteger): CInteger; external name 'Mix_Paused';

procedure Mix_PauseMusic; external name 'Mix_PauseMusic';

procedure Mix_ResumeMusic; external name 'Mix_ResumeMusic';

procedure Mix_RewindMusic; external name 'Mix_RewindMusic';

function Mix_PausedMusic: CInteger; external name 'Mix_PausedMusic';

function Mix_SetMusicPosition(Position: Double): CInteger;
  external name 'Mix_SetMusicPosition';

function Mix_Playing(Chan: CInteger): CInteger; external name 'Mix_Playing';

function Mix_PlayingMusic: CInteger; external name 'Mix_PlayingMusic';

function Mix_SetMusicCMD(const Command: CString): CInteger;
  external name 'Mix_SetMusicCMD';

function Mix_SetSynchroValue(Value: CInteger): CInteger;
  external name 'Mix_SetSynchroValue';

function Mix_GetSynchroValue(Value: CInteger): CInteger;
  external name 'Mix_GetSynchroValue';

function Mix_GetChunk(Chan: CInteger): PMix_Chunk;
  external name 'Mix_GetChunk';

procedure Mix_CloseAudio; external name 'Mix_CloseAudio';

procedure Mix_SetError(fmt: CString); external name 'Mix_SetError';

function Mix_GetError: CString; external name 'Mix_GetError';

end;

end.
