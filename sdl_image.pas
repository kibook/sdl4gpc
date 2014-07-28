module SDL_image;

{$L SDL_image}

export SDL_image = all;

import
  SDL;

const
  SDL_IMAGE_MAJOR_VERSION = 1;
  SDL_IMAGE_MINOR_VERSION = 2;
  SDL_IMAGE_PATCHLEVEL = 5;

type
  pcstring = ^cstring;

function IMG_Linked_Version: PSDL_version;
  external name 'IMG_Linked_Version';

function IMG_LoadTyped_RW(src: PSDL_RWops; freesrc: cinteger;
  _type: cstring): PSDL_Surface; external name 'IMG_LoadTyped_RW';

function IMG_Load(const _file: cstring): PSDL_Surface;
  external name 'IMG_Load';

function IMG_Load_RW(src: PSDL_RWops; freesrc: cinteger): PSDL_Surface;
  external name 'IMG_Load_RW';

function IMG_InvertAlpha(_on: cinteger): cinteger;
  external name 'IMG_InvertAlpha';

function IMG_isBMP(src: PSDL_RWops): cinteger; external name 'IMG_isBMP';

function IMG_isGIF(src: PSDL_RWops): cinteger; external name 'IMG_isGIF';

function IMG_isJPG(src: PSDL_RWops): cinteger; external name 'IMG_isJPG';

function IMG_isLBM(src: PSDL_RWops): cinteger; external name 'IMG_isLBM';

function IMG_isPCX(src: PSDL_RWops): cinteger; external name 'IMG_isPCX';

function IMG_isPNG(src: PSDL_RWops): cinteger; external name 'IMG_isPNG';

function IMG_isPNM(src: PSDL_RWops): cinteger; external name 'IMG_isPNM';

function IMG_isTIF(src: PSDL_RWops): cinteger; external name 'IMG_isTIF';

function IMG_isXCF(src: PSDL_RWops): cinteger; external name 'IMG_isXCF';

function IMG_isXPM(src: PSDL_RWops): cinteger; external name 'IMG_isXPM';

function IMG_isXV(src: PSDL_RWops): cinteger; external name 'IMG_isXV';

function IMG_LoadBMP_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadBMP_RW';

function IMG_LoadGIF_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadGIF_RW';

function IMG_LoadJPG_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadJPG_RW';

function IMG_LoadLBM_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadLBM_RW';

function IMG_LoadPCX_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadPCX_RW';

function IMG_LoadPNM_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadPNM_RW';

function IMG_LoadPNG_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadPNG_RW';

function IMG_LoadTGA_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadTGA_RW';

function IMG_LoadTIF_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadTIF_RW';

function IMG_LoadXCF_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadXCF_RW';

function IMG_LoadXPM_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadXPM_RW';

function IMG_LoadXV_RW(src: PSDL_RWops): PSDL_Surface;
  external name 'IMG_LoadXV_RW';

function IMG_ReadXPMFromArray(xmp: pcstring): PSDL_Surface;
  external name 'IMG_ReadXPMFromArray';

procedure IMG_SetError(fmt: cstring); external name 'IMG_SetError';

function IMG_GetError: cstring; external name 'IMG_GetError';

end;

end.
