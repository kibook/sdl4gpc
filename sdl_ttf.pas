module SDL_ttf;

{$L SDL_ttf}

export SDL_ttf = all;

import
  SDL;

const
  SDL_TTF_MAJOR_VERSION = 2;
  SDL_TTF_MINOR_VERSION = 0;
  SDL_TTF_PATCHLEVEL = 8;

  TTF_STYLE_NORMAL = $00;
  TTF_STYLE_BOLD = $01;
  TTF_STYLE_ITALIC = $02;
  TTF_STYLE_UNDERLINE = $04;

  UNICODE_BOM_NATIVE = $FEFF;
  UNICODE_BOM_SWAPPED = $FFFE;

type
  PTTF_Font = ^TTTF_Font;
  TTTF_Font = record
  end;

function TTF_Linked_Version: PSDL_Version;
  external name 'TTF_Linked_Version';

procedure TTF_ByteSwappedUNICODE(swapped: cinteger);
  external name 'TTF_ByteSwappedUNICODE';

function TTF_Init: cinteger; external name 'TTF_Init';

function TTF_OpenFont(const filename: cstring; ptsize: cinteger): PTTF_Font;
  external name 'TTF_OpenFont';

function TTF_OpenFontIndex(const filename: cstring; ptsize: cinteger;
  index: medint): PTTF_Font; external name 'TTF_OpenFontIndex';

function TTF_OpenFontRW(src: PSDL_RWops;
  freesrc, ptsize: cinteger): PTTF_Font; external name 'TTF_OpenFontRW';

function TTF_OpenFontIndexRW(src: PSDL_RWops; freesrc, ptsize: cinteger;
  index: medint): PTTF_Font; external name 'TTF_OpenFontIndexRW';

function TTF_GetFontStyle(font: PTTF_Font): cinteger;
  external name 'TTF_GetFontStyle';

procedure TTF_SetFontStyle(font: PTTF_Font; style: cinteger);
  external name 'TTF_SetFontStyle';

function TTF_FontHeight(font: PTTF_Font): cinteger;
  external name 'TTF_FontHeight';

function TTF_FontAscent(font: PTTF_Font): cinteger;
  external name 'TTF_FontAscent';

function TTF_FontDescent(font: PTTF_Font): cinteger;
  external name 'TTF_FontDescent';

function TTF_FontLineSkip(font: PTTF_Font): cinteger;
  external name 'TTF_FontLineSkip';

function TTF_FontFaces(font: PTTF_Font): cinteger;
  external name 'TTF_FontFaces';

function TTF_FontFaceIsFixedWidth(font: PTTF_Font): cinteger;
  external name 'TTF_FontFaceIsFixedWidth';

function TTF_FontFaceFamilyName(font: PTTF_Font): cstring;
  external name 'TTF_FontFaceFamilyName';

function TTF_FontFaceStyleName(font: PTTF_Font): cstring;
  external name 'TTF_FontFaceStyleName';

function TTF_GlyphMetrics(font: PTTF_Font; ch: uint16; var minx, maxx,
  miny, maxy, advance: cinteger): cinteger;
  external name 'TTF_GlyphMetrics';

function TTF_SizeText(font: PTTF_Font; const text: cstring;
  var w, y: cinteger): cinteger; external name 'TTF_SizeText';

function TTF_SizeUTF8(font: PTTF_Font; const text: cstring;
  var w, y: cinteger): cinteger; external name 'TTF_SizeUTF8';

function TTF_SizeUNICODE(font: PTTF_Font; const text: puint16;
  var w, y: cinteger): cinteger; external name 'TTF_SizeUNICODE';

function TTF_RenderText_Solid(font: PTTF_Font; const text: cstring;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderText_Solid';

function TTF_RenderUTF8_Solid(font: PTTF_Font; const text: cstring;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderUTF8_Solid';

function TTF_RenderUNICODE_Solid(font: PTTF_Font; const text: puint16;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderUNICODE_Solid';

function TTF_RenderGlyph_Solid(font: PTTF_Font; ch: uint16;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderGlyph_Solid';

function TTF_RenderText_Shaded(font: PTTF_Font; const text: cstring;
  fg, bg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderText_Shaded';

function TTF_RenderUTF8_Shaded(font: PTTF_Font; const text: cstring;
  fg, bg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderUTF8_Shaded';

function TTF_RenderUNICODE_Shaded(font: PTTF_Font; const text: puint16;
  fg, bg: TSDL_Color): PSDL_Surface;
  external name 'TTF_RenderUNICODE_Shaded';

function TTF_RenderGlyph_Shaded(font: PTTF_Font; ch: uint16;
  fg, bg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderGlyph_Shaded';

function TTF_RenderText_Blended(font: PTTF_Font; const text: cstring;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderText_Blended';

function TTF_RenderUTF8_Blended(font: PTTF_Font; const text: cstring;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderUTF8_Blended';

function TTF_RenderUNICODE_Blended(font: PTTF_Font; const text: puint16;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderUNICODE_Blended';

function TTF_RenderGlyph_Blended(font: PTTF_Font; ch: uint16;
  fg: TSDL_Color): PSDL_Surface; external name 'TTF_RenderText_Blended';

procedure TTF_CloseFont(font: PTTF_Font); external name 'TTF_CloseFont';

procedure TTF_Quit; external name 'TTF_Quit';

function TTF_WasInit: cinteger; external name 'TTF_WasInit';

procedure TTF_SetError(fmt: cstring); external name 'TTF_SetError';

function TTF_GetError: cstring; external name 'TTF_GetError';

end;

end.
