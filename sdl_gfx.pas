module SDL_gfx;

{$L SDL_gfx}

export SDL_gfx = all;

import
  SDL;

const
  FPS_UPPER_LIMIT = 200;
  FPS_LOWER_LIMIT = 1;
  FPS_DEFAULT = 30;

  SMOOTHING_OFF = 0;
  SMOOTHING_ON = 1;

type
  PFPSmanager = ^TFPSmanager;
  TFPSmanager = packed record
    FrameCount: UInt32;
    RateTicks: Single;
    LastTicks: UInt32;
    Rate: UInt32;
  end;

  PColorRGBA = ^TColorRGBA;
  TColorRGBA = packed record
    r: UInt8;
    g: UInt8;
    b: UInt8;
    a: UInt8;
  end;

  PColorY = ^TColorY;
  TColorY = packed record
    y: UInt8;
  end;

  PShortInt = ^ShortInt;

procedure SDL_InitFramerate(manager: PFPSmanager);
  external name 'SDL_initFramerate';

function SDL_SetFramerate(manager: PFPSmanager; rate: CInteger): CInteger;
  external name 'SDL_getFramerate';

procedure SDL_FramerateDelay(manager: PFPSmanager);
  external name 'SDL_framerateDelay';

function pixelColor(dst: PSDL_Surface; x, y: SInt16;
  Color: UInt32): CInteger; external name 'pixelColor';

function pixelRGBA(dst: PSDL_Surface; x, y: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'pixelRGBA';

function hlineColor(dst: PSDL_Surface; x1, x2, y: SInt16;
  Color: UInt32): CInteger; external name 'hlineColor';

function hlineRGBA(dst: PSDL_Surface; x1, x2, y: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'hlineRGBA';

function vlineColor(dst: PSDL_Surface; x, y1, y2: SInt16;
  Color: UInt32): CInteger; external name 'vlineColor';

function vlineRGBA(dst: PSDL_Surface; x, y1, y2: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'vlineRGBA';

function rectangleColor(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  Color: UInt32): CInteger; external name 'rectangleColor';

function rectangleRGBA(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  r, g, b, a: UInt32): CInteger; external name 'rectangleRGBA';

function boxColor(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  Color: UInt32): CInteger; external name 'boxColor';

function boxRGBA(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'boxRGBA';

function lineColor(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  Color: UInt32): CInteger; external name 'lineColor';

function lineRGBA(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'lineRGBA';

function aalineColor(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  Color: UInt32): CInteger; external name 'aalineColor';

function aalineRGBA(dst: PSDL_Surface; x1, y1, x2, y2: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'aalineRGBA';

function circleColor(dst: PSDL_Surface; x, y, rad: SInt16;
  Color: UInt32): CInteger; external name 'circleColor';

function circleRGBA(dst: PSDL_Surface; x, y, rad: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'circleRGBA';

function aacircleColor(dst: PSDL_Surface; x, y, rad: SInt16;
  Color: UInt32): CInteger; external name 'aacircleColor';

function aacircleRGBA(dst: PSDL_Surface; x, y, rad: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'aacircleRGBA';

function filledCircleColor(dst: PSDL_Surface; x, y, rad: SInt16;
  Color: UInt32): CInteger; external name 'filledCircleColor';

function filledCircleRGBA(dst: PSDL_Surface; x, y, rad: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'filledCircleRGBA';

function ellipseColor(dst: PSDL_Surface; x, y, rx, ry: SInt16;
  Color: UInt32): CInteger; external name 'ellipseColor';

function ellipseRGBA(dst: PSDL_Surface; x, y, rx, ry: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'ellipseRGBA';

function aaellipseColor(dst: PSDL_Surface; x, y, rx, ry: SInt16;
  Color: UInt32): CInteger; external name 'aaellipseColor';

function aaellipseRGBA(dst: PSDL_Surface; x, y, rx, ry: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'aaellipseRGBA';

function filledEllipseColor(dst: PSDL_Surface; x, y, rx, ry: SInt16;
  Color: UInt32): CInteger; external name 'filledEllipseColor';

function filledEllipseRGBA(dst: PSDL_Surface; x, y, rx, ry: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'filledEllipseRGBA';

function pieColor(dst: PSDL_Surface; x, y, rad, start, finish: SInt16;
  Color: UInt32): CInteger; external name 'pieColor';

function pieRGBA(dst: PSDL_Surface; x, y, rad, start, finish: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'pieRGBA';

function trigonColor(dst: PSDL_Surface; x1, y1, x2, y2, x3, y3: SInt16;
  Color: UInt32): CInteger; external name 'trigonColor';

function trigonRGBA(dst: PSDL_Surface; x1, y1, x2, y2, x3, y3: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'trigonRGBA';

function aatrigonColor(dst: PSDL_Surface; x1, y1, x2, y2, x3, y3: SInt16;
  color: UInt32): CInteger; external name 'aatrigonColor';

function aatrigonRGBA(dst: PSDL_Surface; x1, y1, x2, y2, x3, y3: SInt16;
  r, g, b, a: UInt8): CInteger; external name 'aatrigonRGBA';

function filledTrigonColor(dst: PSDL_Surface;
  x1, y1, x2, y2, x3, y3: SInt16; Color: UInt32): CInteger;
  external name 'filledTrigonColor';

function filledTrigonRGBA(dst: PSDL_Surface;
  x1, y1, x2, y2, x3, y3: SInt16; r, g, b, a: UInt8): CInteger;
  external name 'filledTrigonRGBA';

function polygonColor(dst: PSDL_Surface; const vx, vy: PSInt16;
  n: CInteger; color: UInt32): CInteger; external name 'polygonColor';

function polygonRGBA(dst: PSDL_Surface; const vx, vy: PSInt16;
  n: CInteger; r, g, b, a: UInt8): CInteger; external name 'polygonColor';

function aapolygonColor(dst: PSDL_Surface; const vx, vy: PSInt16;
  n: CInteger; color: UInt32): CInteger; external name 'aapolygonColor';

function aapolygonRGBA(dst: PSDL_Surface; const vx, vy: PSInt16;
  n: CInteger; r, g, b, a: UInt8): CInteger; external name 'aapolygonColor';

function filledPolygonColor(dst: PSDL_Surface; const vx, vy: PSInt16;
  n: CInteger; color: UInt32): CInteger;
  external name 'filledPolygonColor';

function filledPolygonRGBA(dst: PSDL_Surface; const vx, vy: PSInt16;
  n: CInteger; r, g, b, a: UInt8): CInteger;
  external name 'filledPolygonColor';

function bezierColor(dst: PSDL_Surface; const vx, vy: PSInt16;
  n, s: CInteger; Color: UInt32): CInteger; external name 'bezierColor';

function bezierRGBA(dst: PSDL_Surface; const vx, vy: PSInt16;
  n, s: CInteger; r, g, b, a: UInt8): CInteger; external name 'bezierRGBA';

function characterColor(dst: PSDL_Surface; x, y: SInt16; c: char;
  color: UInt32): CInteger; external name 'characterColor';

function characterRGBA(dst: PSDL_Surface; x, y: SInt16; c: char;
  r, g, b, a: UInt8): CInteger; external name 'characterRGBA';

function stringColor(dst: PSDL_Surface; x, y: SInt16; const c: CString;
  color: UInt32): CInteger; external name 'stringColor';

function stringRGBA(dst: PSDL_Surface; x, y: SInt16; const c: CString;
  r, g, b, a: UInt8): CInteger; external name 'stringRGBA';

procedure gfxPrimitiveSetFont(const fontdata: Pointer; cw, ch: CInteger);
  external name 'gfxPrimitiveSetFont';

function SDL_imageFilterMMXdetect: CInteger;
  external name 'SDL_imageFilterMMXdetect';

procedure SDL_imageFilterMMXoff; external name 'SDL_imageFilterMMXoff';

procedure SDL_imageFilterMMXon; external name 'SDL_imageFilterMMXon';

function SDL_imageFilterAdd(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterAdd';

function SDL_imageFilterMean(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterMean';

function SDL_imageFilterSub(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterSub';

function SDL_imageFilterAbsDiff(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterAbsDiff';

function SDL_imageFilterMult(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterMult';

function SDL_imageFilterMultNor(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterMultNor';

function SDL_imageFilterDivby2(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterDivby2';

function SDL_imageFilterDivby4(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterDivby4';

function SDL_imageFilterBitAnd(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterBitAnd';

function SDL_imageFilterBitOr(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterBitOr';

function SDL_imageFilterDiv(src1, src2, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterDiv';

function SDL_imageFilterBitNegation(src1, dest: CString;
  length: CInteger): CInteger; external name 'SDL_imageFilterBitNegation';

function SDL_imageFilterAddByte(src1, dest: CString; length: CInteger;
  c: char): CInteger; external name 'SDL_imageFilterAddByte';

function SDL_imageFilterAddUint(src1, dest: CString; length: CInteger;
  c: Cardinal): CInteger; external name 'SDL_imageFilterAddUint';

function SDL_imageFilterAddByteToHalf(src1, dest: CString; length: CInteger;
  c: char): CInteger; external name 'SDL_imageFilterAddByteToHalf';

function SDL_imageFilterSubByte(src1, dest: CString; length: CInteger;
  c: char): CInteger; external name 'SDL_imageFilterSubByte';

function SDL_imageFilterSubUint(src1, dest: CString; length: CInteger;
  c: Cardinal): CInteger; external name 'SDL_imageFilterSubUint';

function SDL_imageFilterShiftRight(src1, dest: CString; length: CInteger;
  n: char): CInteger; external name 'SDL_imageFilterShiftRight';

function SDL_imageFilterShiftRightUint(src1, dest: CString;
  length: CInteger; n: char): CInteger;
  external name 'SDL_imageFilterShiftRightUint';

function SDL_imageFilterMultByByte(src1, dest: CString; length: CInteger;
  c: char): CInteger; external name 'SDL_imageFilterMultByByte';

function SDL_imageFilterShiftRightAndMultByByte(src1, dest: CString;
  length: CInteger; n, c: char): CInteger;
  external name 'SDL_imageFilterShiftRightAndMultByByte';

function SDL_imageFilterShiftLeftByte(src1, dest: CString; length: CInteger;
  n, c: char): CInteger; external name 'SDL_imageFilterShiftLeftByte';

function SDL_imageFilterShiftLeftUint(src1, dest: CString; length: CInteger;
  n: char): CInteger; external name 'SDL_imageFilterShiftLeftUint';

function SDL_imageFilterShiftLeft(src1, dest: CString; length: CInteger;
  n: char): CInteger; external name 'SDL_imageFilterShiftLeft';

function SDL_imageFilterBinarizeUsingThreshold(src1, dest: CString;
  length: CInteger; t: char): CInteger;
  external name 'SDL_imageFilterBinarizeUsingThreshold';

function SDL_imageFilterClipToRange(src1, dest: CString; length: CInteger;
  tmin, tmax: Byte): CInteger; external name 'SDL_imageFilterClipToRange';

function SDL_imageFilterNormalizeLinear(src1, dest: CString;
  length: CInteger; cmin, cmax, nmin, nmax: CInteger): CInteger;
  external name 'SDL_imageFilterNormalizeLinear';

function SDL_imageFilterConvolveKernel3x3Divide(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; divisor: Byte): CInteger;
  external name 'SDL_imageFilterConvolveKernel3x3Divide';

function SDL_imageFilterConvolveKernel5x5Divide(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; divisor: Byte): CInteger;
  external name 'SDL_imageFilterConvolveKernel5x5Divide';

function SDL_imageFilterConvolveKernel7x7Divide(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; divisor: Byte): CInteger;
  external name 'SDL_imageFilterConvolveKernel7x7Divide';

function SDL_imageFilterConvolveKernel9x9Divide(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; divisor: Byte): CInteger;
  external name 'SDL_imageFilterConvolveKernel9x9Divide';

function SDL_imageFilterConvolveKernel3x3ShiftRight(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; NRightShift: char): CInteger;
  external name 'SDL_imageFilterConvolveKernel3x3ShiftRight';

function SDL_imageFilterConvolveKernel5x5ShiftRight(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; NRightShift: char): CInteger;
  external name 'SDL_imageFilterConvolveKernel5x5ShiftRight';

function SDL_imageFilterConvolveKernel7x7ShiftRight(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; NRightShift: char): CInteger;
  external name 'SDL_imageFilterConvolveKernel7x7ShiftRight';

function SDL_imageFilterConvolveKernel9x9ShiftRight(src, dest: CString;
  rows, columns: CInteger; kernel: PShortInt; NRightShift: char): CInteger;
  external name 'SDL_imageFilterConvolveKernel9x9ShiftRight';

function SDL_imageFilterSobelX(src, dest: CString;
  rows, columns: CInteger): CInteger; external name 'SDL_imageFilterSobelX';

function SDL_imageFilterSobelXShiftRight(src, dest: CString;
  rows, columns: CInteger; NRightShift: char): CInteger;
  external name 'SDL_imageFilterSobelXShiftRight';

procedure SDL_imageFilterAlignStack;
  external name 'SDL_imageFilterAlignStack';

procedure SDL_imageFilterRestoreStack;
  external name 'SDL_imageFilterRestoreStack';

function rotozoomSurface(src: PSDL_Surface; angle, zoom: double;
  smooth: cinteger): PSDL_Surface; external name 'rotozoomSurface';

function rotozoomSurfaceXY(src: PSDL_Surface; angle, zoomx, zoomy: double;
  smooth: cinteger): PSDL_Surface; external name 'rotozoomSurfaceXY';

procedure rotozoomSurfaceSize(width, height: cinteger; angle, zoom: double;
  var dstwidth, dstheight: cinteger); external name 'rotozoomSurfaceSize';

procedure rotozoomSurfaceSizeXY(width, height: cinteger;
  angle, zoomx, zoomy: double; var dstwidth, dstheight: cinteger);
  external name 'rotozoomSurfaceSizeXY';

function zoomSurface(src: PSDL_Surface; zoomx, zoomy: double;
  smooth: cinteger): PSDL_Surface; external name 'zoomSurface';

procedure zoomSurfaceSize(width, height: cinteger; zoomx, zoomy: double;
  var dstwidth, dstheight: cinteger); external name 'zoomSurfaceSize';

end;

end.
