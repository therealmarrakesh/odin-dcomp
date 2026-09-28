// Bindings for [[ DirectComposition ; https://learn.microsoft.com/en-us/windows/win32/api/_directcomp/ ]].
package directx_dcomp

foreign import dcomp "system:dcomp.lib"

import "../dxgi"
import win32 "core:sys/windows"

IUnknown        :: dxgi.IUnknown
IUnknown_VTable :: dxgi.IUnknown_VTable

HANDLE        :: dxgi.HANDLE
HRESULT       :: dxgi.HRESULT
HWND          :: dxgi.HWND
LUID          :: dxgi.LUID
IID           :: dxgi.IID
SIZE_T        :: dxgi.SIZE_T
BOOL          :: dxgi.BOOL
DWORD         :: dxgi.DWORD
LARGE_INTEGER :: dxgi.LARGE_INTEGER

RECT  :: dxgi.RECT
POINT :: dxgi.POINT

SECURITY_ATTRIBUTES :: win32.SECURITY_ATTRIBUTES

@(default_calling_convention="system", link_prefix="DComposition")
foreign dcomp {
	CreateDevice           :: proc(dxgiDevice: ^dxgi.IDevice, iid: ^IID, dcompositionDevice: ^rawptr) -> HRESULT ---
	CreateDevice2          :: proc(renderingDevice: ^IUnknown, iid: ^IID, dcompositionDevice: ^rawptr) -> HRESULT ---
	CreateDevice3          :: proc(renderingDevice: ^IUnknown, iid: ^IID, dcompositionDevice: ^rawptr) -> HRESULT ---
	CreateSurfaceHandle    :: proc(desiredAccess: DWORD, securityAttributes: ^SECURITY_ATTRIBUTES, surfaceHandle: ^HANDLE) -> HRESULT ---
	AttachMouseWheelToHwnd :: proc(visual: ^IVisual, hwnd: HWND, enable: BOOL) -> HRESULT ---
	AttachMouseDragToHwnd  :: proc(visual: ^IVisual, hwnd: HWND, enable: BOOL) -> HRESULT ---
	GetFrameId             :: proc(frameIdType: COMPOSITION_FRAME_ID_TYPE, frameId: ^COMPOSITION_FRAME_ID) -> HRESULT ---
	GetStatistics          :: proc(frameId: COMPOSITION_FRAME_ID, frameStats: ^COMPOSITION_FRAME_STATS, targetIdCount: u32, targetIds: [^]COMPOSITION_TARGET_ID, actualTargetIdCount: ^u32) -> HRESULT ---
	GetTargetStatistics    :: proc(frameId: COMPOSITION_FRAME_ID, targetId: ^COMPOSITION_TARGET_ID, targetStats: ^COMPOSITION_TARGET_STATS) -> HRESULT ---
	BoostCompositorClock   :: proc(enable: BOOL) -> HRESULT ---
	WaitForCompositorClock :: proc(count: u32, handles: [^]HANDLE, timeoutInMs: DWORD) -> DWORD ---
}


D3DCOLORVALUE :: dxgi.D3DCOLORVALUE

D3DMATRIX :: struct {
	_11: f32,
	_12: f32,
	_13: f32,
	_14: f32,
	_21: f32,
	_22: f32,
	_23: f32,
	_24: f32,
	_31: f32,
	_32: f32,
	_33: f32,
	_34: f32,
	_41: f32,
	_42: f32,
	_43: f32,
	_44: f32,
}

D2D_MATRIX_3X2_F :: struct {
	_11: f32,
	_12: f32,
	_21: f32,
	_22: f32,
	_31: f32,
	_32: f32,
}

D2D_MATRIX_4X4_F :: struct {
	_11: f32,
	_12: f32,
	_13: f32,
	_14: f32,
	_21: f32,
	_22: f32,
	_23: f32,
	_24: f32,
	_31: f32,
	_32: f32,
	_33: f32,
	_34: f32,
	_41: f32,
	_42: f32,
	_43: f32,
	_44: f32,
}

D2D_MATRIX_5X4_F :: struct {
	_11: f32,
	_12: f32,
	_13: f32,
	_14: f32,
	_21: f32,
	_22: f32,
	_23: f32,
	_24: f32,
	_31: f32,
	_32: f32,
	_33: f32,
	_34: f32,
	_41: f32,
	_42: f32,
	_43: f32,
	_44: f32,
	_51: f32,
	_52: f32,
	_53: f32,
	_54: f32,
}

D2D_VECTOR_2F :: struct {
	x: f32,
	y: f32,
}

D2D_VECTOR_4F :: struct {
	x: f32,
	y: f32,
	z: f32,
	w: f32,
}

D2D_RECT_F :: struct {
	left:   f32,
	top:    f32,
	right:  f32,
	bottom: f32,
}

D2D_RECT_U :: struct {
	left:   u32,
	top:    u32,
	right:  u32,
	bottom: u32,
}

D2D_RECT_L :: RECT

D2D1_COLOR_F      :: D3DCOLORVALUE
D2D1_MATRIX_3X2_F :: D2D_MATRIX_3X2_F
D2D1_MATRIX_5X4_F :: D2D_MATRIX_5X4_F
D2D1_VECTOR_2F    :: D2D_VECTOR_2F
D2D1_VECTOR_4F    :: D2D_VECTOR_4F

D2D1_BORDER_MODE :: enum i32 {
	SOFT        = 0,
	HARD        = 1,
	FORCE_DWORD = -1,
}

D2D1_COLORMATRIX_ALPHA_MODE :: enum i32 {
	PREMULTIPLIED = 1,
	STRAIGHT      = 2,
	FORCE_DWORD   = -1,
}

D2D1_TURBULENCE_NOISE :: enum i32 {
	FRACTAL_SUM = 0,
	TURBULENCE  = 1,
	FORCE_DWORD = -1,
}

D2D1_COMPOSITE_MODE :: enum i32 {
	SOURCE_OVER         = 0,
	DESTINATION_OVER    = 1,
	SOURCE_IN           = 2,
	DESTINATION_IN      = 3,
	SOURCE_OUT          = 4,
	DESTINATION_OUT     = 5,
	SOURCE_ATOP         = 6,
	DESTINATION_ATOP    = 7,
	XOR                 = 8,
	PLUS                = 9,
	SOURCE_COPY         = 10,
	BOUNDED_SOURCE_COPY = 11,
	MASK_INVERT         = 12,
	FORCE_DWORD         = -1,
}

D2D1_BLEND_MODE :: enum i32 {
	MULTIPLY      = 0,
	SCREEN        = 1,
	DARKEN        = 2,
	LIGHTEN       = 3,
	DISSOLVE      = 4,
	COLOR_BURN    = 5,
	LINEAR_BURN   = 6,
	DARKER_COLOR  = 7,
	LIGHTER_COLOR = 8,
	COLOR_DODGE   = 9,
	LINEAR_DODGE  = 10,
	OVERLAY       = 11,
	SOFT_LIGHT    = 12,
	HARD_LIGHT    = 13,
	VIVID_LIGHT   = 14,
	LINEAR_LIGHT  = 15,
	PIN_LIGHT     = 16,
	HARD_MIX      = 17,
	DIFFERENCE    = 18,
	EXCLUSION     = 19,
	HUE           = 20,
	SATURATION    = 21,
	COLOR         = 22,
	LUMINOSITY    = 23,
	SUBTRACT      = 24,
	DIVISION      = 25,
	FORCE_DWORD   = -1,
}

D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE :: enum i32 {
	NEAREST_NEIGHBOR    = 0,
	LINEAR              = 1,
	CUBIC               = 2,
	MULTI_SAMPLE_LINEAR = 3,
	ANISOTROPIC         = 4,
	HIGH_QUALITY_CUBIC  = 5,
	FORCE_DWORD         = -1,
}


BITMAP_INTERPOLATION_MODE :: enum i32 {
	NEAREST_NEIGHBOR = 0,
	LINEAR           = 1,
	INHERIT          = -1,
}

BORDER_MODE :: enum i32 {
	SOFT    = 0,
	HARD    = 1,
	INHERIT = -1,
}

COMPOSITE_MODE :: enum i32 {
	SOURCE_OVER        = 0,
	DESTINATION_INVERT = 1,
	MIN_BLEND          = 2,
	INHERIT            = -1,
}

BACKFACE_VISIBILITY :: enum i32 {
	VISIBLE = 0,
	HIDDEN  = 1,
	INHERIT = -1,
}

OPACITY_MODE :: enum i32 {
	LAYER    = 0,
	MULTIPLY = 1,
	INHERIT  = -1,
}

DEPTH_MODE :: enum i32 {
	TREE    = 0,
	SPATIAL = 1,
	SORTED  = 3,
	INHERIT = -1,
}

FRAME_STATISTICS :: struct {
	lastFrameTime:          LARGE_INTEGER,
	currentCompositionRate: dxgi.RATIONAL,
	currentTime:            LARGE_INTEGER,
	timeFrequency:          LARGE_INTEGER,
	nextEstimatedFrameTime: LARGE_INTEGER,
}

COMPOSITIONOBJECT_READ       :: 0x0001
COMPOSITIONOBJECT_WRITE      :: 0x0002
COMPOSITIONOBJECT_ALL_ACCESS :: COMPOSITIONOBJECT_READ | COMPOSITIONOBJECT_WRITE

COMPOSITION_FRAME_ID_TYPE :: enum i32 {
	CREATED   = 0,
	CONFIRMED = 1,
	COMPLETED = 2,
}

COMPOSITION_FRAME_ID :: u64

COMPOSITION_FRAME_STATS :: struct {
	startTime:   u64,
	targetTime:  u64,
	framePeriod: u64,
}

COMPOSITION_TARGET_ID :: struct {
	displayAdapterLuid: LUID,
	renderAdapterLuid:  LUID,
	vidPnSourceId:      u32,
	vidPnTargetId:      u32,
	uniqueId:           u32,
}

COMPOSITION_STATS :: struct {
	presentCount:        u32,
	refreshCount:        u32,
	virtualRefreshCount: u32,
	time:                u64,
}

COMPOSITION_TARGET_STATS :: struct {
	outstandingPresents: u32,
	presentTime:         u64,
	vblankDuration:      u64,
	presentedStats:      COMPOSITION_STATS,
	completedStats:      COMPOSITION_STATS,
}

MAX_WAITFORCOMPOSITORCLOCK_OBJECTS :: 32
COMPOSITION_STATS_MAX_TARGETS      :: 256


IAnimation_UUID_STRING :: "CBFD91D9-51B2-45E4-B3DE-D19CCFB863C5"
IAnimation_UUID := &IID{0xCBFD91D9, 0x51B2, 0x45E4, {0xB3, 0xDE, 0xD1, 0x9C, 0xCF, 0xB8, 0x63, 0xC5}}
IAnimation :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositionanimation_vtable: ^IAnimation_VTable,
}
IAnimation_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	Reset:                proc "system" (this: ^IAnimation) -> HRESULT,
	SetAbsoluteBeginTime: proc "system" (this: ^IAnimation, beginTime: LARGE_INTEGER) -> HRESULT,
	AddCubic:             proc "system" (this: ^IAnimation, beginOffset: f64, constantCoefficient: f32, linearCoefficient: f32, quadraticCoefficient: f32, cubicCoefficient: f32) -> HRESULT,
	AddSinusoidal:        proc "system" (this: ^IAnimation, beginOffset: f64, bias: f32, amplitude: f32, frequency: f32, phase: f32) -> HRESULT,
	AddRepeat:            proc "system" (this: ^IAnimation, beginOffset: f64, durationToRepeat: f64) -> HRESULT,
	End:                  proc "system" (this: ^IAnimation, endOffset: f64, endValue: f32) -> HRESULT,
}


IDevice_UUID_STRING :: "C37EA93A-E7AA-450D-B16F-9746CB0407F3"
IDevice_UUID := &IID{0xC37EA93A, 0xE7AA, 0x450D, {0xB1, 0x6F, 0x97, 0x46, 0xCB, 0x04, 0x07, 0xF3}}
IDevice :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositiondevice_vtable: ^IDevice_VTable,
}
IDevice_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	Commit:                     proc "system" (this: ^IDevice) -> HRESULT,
	WaitForCommitCompletion:    proc "system" (this: ^IDevice) -> HRESULT,
	GetFrameStatistics:         proc "system" (this: ^IDevice, statistics: ^FRAME_STATISTICS) -> HRESULT,
	CreateTargetForHwnd:        proc "system" (this: ^IDevice, hwnd: HWND, topmost: BOOL, target: ^^ITarget) -> HRESULT,
	CreateVisual:               proc "system" (this: ^IDevice, visual: ^^IVisual) -> HRESULT,
	CreateSurface:              proc "system" (this: ^IDevice, width: u32, height: u32, pixelFormat: dxgi.FORMAT, alphaMode: dxgi.ALPHA_MODE, surface: ^^ISurface) -> HRESULT,
	CreateVirtualSurface:       proc "system" (this: ^IDevice, initialWidth: u32, initialHeight: u32, pixelFormat: dxgi.FORMAT, alphaMode: dxgi.ALPHA_MODE, virtualSurface: ^^IVirtualSurface) -> HRESULT,
	CreateSurfaceFromHandle:    proc "system" (this: ^IDevice, handle: HANDLE, surface: ^^IUnknown) -> HRESULT,
	CreateSurfaceFromHwnd:      proc "system" (this: ^IDevice, hwnd: HWND, surface: ^^IUnknown) -> HRESULT,
	CreateTranslateTransform:   proc "system" (this: ^IDevice, translateTransform: ^^ITranslateTransform) -> HRESULT,
	CreateScaleTransform:       proc "system" (this: ^IDevice, scaleTransform: ^^IScaleTransform) -> HRESULT,
	CreateRotateTransform:      proc "system" (this: ^IDevice, rotateTransform: ^^IRotateTransform) -> HRESULT,
	CreateSkewTransform:        proc "system" (this: ^IDevice, skewTransform: ^^ISkewTransform) -> HRESULT,
	CreateMatrixTransform:      proc "system" (this: ^IDevice, matrixTransform: ^^IMatrixTransform) -> HRESULT,
	CreateTransformGroup:       proc "system" (this: ^IDevice, transforms: [^]^ITransform, elements: u32, transformGroup: ^^ITransform) -> HRESULT,
	CreateTranslateTransform3D: proc "system" (this: ^IDevice, translateTransform3D: ^^ITranslateTransform3D) -> HRESULT,
	CreateScaleTransform3D:     proc "system" (this: ^IDevice, scaleTransform3D: ^^IScaleTransform3D) -> HRESULT,
	CreateRotateTransform3D:    proc "system" (this: ^IDevice, rotateTransform3D: ^^IRotateTransform3D) -> HRESULT,
	CreateMatrixTransform3D:    proc "system" (this: ^IDevice, matrixTransform3D: ^^IMatrixTransform3D) -> HRESULT,
	CreateTransform3DGroup:     proc "system" (this: ^IDevice, transforms3D: [^]^ITransform3D, elements: u32, transform3DGroup: ^^ITransform3D) -> HRESULT,
	CreateEffectGroup:          proc "system" (this: ^IDevice, effectGroup: ^^IEffectGroup) -> HRESULT,
	CreateRectangleClip:        proc "system" (this: ^IDevice, clip: ^^IRectangleClip) -> HRESULT,
	CreateAnimation:            proc "system" (this: ^IDevice, animation: ^^IAnimation) -> HRESULT,
	CheckDeviceState:           proc "system" (this: ^IDevice, pfValid: ^BOOL) -> HRESULT,
}

ITarget_UUID_STRING :: "EACDD04C-117E-4E17-88F4-D1B12B0E3D89"
ITarget_UUID := &IID{0xEACDD04C, 0x117E, 0x4E17, {0x88, 0xF4, 0xD1, 0xB1, 0x2B, 0x0E, 0x3D, 0x89}}
ITarget :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositiontarget_vtable: ^ITarget_VTable,
}
ITarget_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetRoot: proc "system" (this: ^ITarget, visual: ^IVisual) -> HRESULT,
}

IVisual_UUID_STRING :: "4D93059D-097B-4651-9A60-F0F25116E2F3"
IVisual_UUID := &IID{0x4D93059D, 0x097B, 0x4651, {0x9A, 0x60, 0xF0, 0xF2, 0x51, 0x16, 0xE2, 0xF3}}
IVisual :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositionvisual_vtable: ^IVisual_VTable,
}
IVisual_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetOffsetX:                 proc "system" (this: ^IVisual, animation: ^IAnimation) -> HRESULT,
	SetOffsetX2:                proc "system" (this: ^IVisual, offsetX: f32) -> HRESULT,
	SetOffsetY:                 proc "system" (this: ^IVisual, animation: ^IAnimation) -> HRESULT,
	SetOffsetY2:                proc "system" (this: ^IVisual, offsetY: f32) -> HRESULT,
	SetTransform:               proc "system" (this: ^IVisual, transform: ^ITransform) -> HRESULT,
	SetTransform2:              proc "system" (this: ^IVisual, pMatrix: ^D2D_MATRIX_3X2_F) -> HRESULT,
	SetTransformParent:         proc "system" (this: ^IVisual, visual: ^IVisual) -> HRESULT,
	SetEffect:                  proc "system" (this: ^IVisual, effect: ^IEffect) -> HRESULT,
	SetBitmapInterpolationMode: proc "system" (this: ^IVisual, interpolationMode: BITMAP_INTERPOLATION_MODE) -> HRESULT,
	SetBorderMode:              proc "system" (this: ^IVisual, borderMode: BORDER_MODE) -> HRESULT,
	SetClip:                    proc "system" (this: ^IVisual, clip: ^IClip) -> HRESULT,
	SetClip2:                   proc "system" (this: ^IVisual, rect: ^D2D_RECT_F) -> HRESULT,
	SetContent:                 proc "system" (this: ^IVisual, content: ^IUnknown) -> HRESULT,
	AddVisual:                  proc "system" (this: ^IVisual, visual: ^IVisual, insertAbove: BOOL, referenceVisual: ^IVisual) -> HRESULT,
	RemoveVisual:               proc "system" (this: ^IVisual, visual: ^IVisual) -> HRESULT,
	RemoveAllVisuals:           proc "system" (this: ^IVisual) -> HRESULT,
	SetCompositeMode:           proc "system" (this: ^IVisual, compositeMode: COMPOSITE_MODE) -> HRESULT,
}

IEffect_UUID_STRING :: "EC81B08F-BFCB-4E8D-B193-A915587999E8"
IEffect_UUID := &IID{0xEC81B08F, 0xBFCB, 0x4E8D, {0xB1, 0x93, 0xA9, 0x15, 0x58, 0x79, 0x99, 0xE8}}
IEffect :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositioneffect_vtable: ^IEffect_VTable,
}
IEffect_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
}

ITransform3D_UUID_STRING :: "71185722-246B-41F2-AAD1-0443F7F4BFC2"
ITransform3D_UUID := &IID{0x71185722, 0x246B, 0x41F2, {0xAA, 0xD1, 0x04, 0x43, 0xF7, 0xF4, 0xBF, 0xC2}}
ITransform3D :: struct #raw_union {
	#subtype idcompositioneffect: IEffect,
	using idcompositiontransform3d_vtable: ^ITransform3D_VTable,
}
ITransform3D_VTable :: struct {
	using idcompositioneffect_vtable: IEffect_VTable,
}

ITransform_UUID_STRING :: "FD55FAA7-37E0-4C20-95D2-9BE45BC33F55"
ITransform_UUID := &IID{0xFD55FAA7, 0x37E0, 0x4C20, {0x95, 0xD2, 0x9B, 0xE4, 0x5B, 0xC3, 0x3F, 0x55}}
ITransform :: struct #raw_union {
	#subtype idcompositiontransform3d: ITransform3D,
	using idcompositiontransform_vtable: ^ITransform_VTable,
}
ITransform_VTable :: struct {
	using idcompositiontransform3d_vtable: ITransform3D_VTable,
}

ITranslateTransform_UUID_STRING :: "06791122-C6F0-417D-8323-269E987F5954"
ITranslateTransform_UUID := &IID{0x06791122, 0xC6F0, 0x417D, {0x83, 0x23, 0x26, 0x9E, 0x98, 0x7F, 0x59, 0x54}}
ITranslateTransform :: struct #raw_union {
	#subtype idcompositiontransform: ITransform,
	using idcompositiontranslatetransform_vtable: ^ITranslateTransform_VTable,
}
ITranslateTransform_VTable :: struct {
	using idcompositiontransform_vtable: ITransform_VTable,
	SetOffsetX:  proc "system" (this: ^ITranslateTransform, animation: ^IAnimation) -> HRESULT,
	SetOffsetX2: proc "system" (this: ^ITranslateTransform, offsetX: f32) -> HRESULT,
	SetOffsetY:  proc "system" (this: ^ITranslateTransform, animation: ^IAnimation) -> HRESULT,
	SetOffsetY2: proc "system" (this: ^ITranslateTransform, offsetY: f32) -> HRESULT,
}

IScaleTransform_UUID_STRING :: "71FDE914-40EF-45EF-BD51-68B037C339F9"
IScaleTransform_UUID := &IID{0x71FDE914, 0x40EF, 0x45EF, {0xBD, 0x51, 0x68, 0xB0, 0x37, 0xC3, 0x39, 0xF9}}
IScaleTransform :: struct #raw_union {
	#subtype idcompositiontransform: ITransform,
	using idcompositionscaletransform_vtable: ^IScaleTransform_VTable,
}
IScaleTransform_VTable :: struct {
	using idcompositiontransform_vtable: ITransform_VTable,
	SetScaleX:   proc "system" (this: ^IScaleTransform, animation: ^IAnimation) -> HRESULT,
	SetScaleX2:  proc "system" (this: ^IScaleTransform, scaleX: f32) -> HRESULT,
	SetScaleY:   proc "system" (this: ^IScaleTransform, animation: ^IAnimation) -> HRESULT,
	SetScaleY2:  proc "system" (this: ^IScaleTransform, scaleY: f32) -> HRESULT,
	SetCenterX:  proc "system" (this: ^IScaleTransform, animation: ^IAnimation) -> HRESULT,
	SetCenterX2: proc "system" (this: ^IScaleTransform, centerX: f32) -> HRESULT,
	SetCenterY:  proc "system" (this: ^IScaleTransform, animation: ^IAnimation) -> HRESULT,
	SetCenterY2: proc "system" (this: ^IScaleTransform, centerY: f32) -> HRESULT,
}

IRotateTransform_UUID_STRING :: "641ED83C-AE96-46C5-90DC-32774CC5C6D5"
IRotateTransform_UUID := &IID{0x641ED83C, 0xAE96, 0x46C5, {0x90, 0xDC, 0x32, 0x77, 0x4C, 0xC5, 0xC6, 0xD5}}
IRotateTransform :: struct #raw_union {
	#subtype idcompositiontransform: ITransform,
	using idcompositionrotatetransform_vtable: ^IRotateTransform_VTable,
}
IRotateTransform_VTable :: struct {
	using idcompositiontransform_vtable: ITransform_VTable,
	SetAngle:    proc "system" (this: ^IRotateTransform, animation: ^IAnimation) -> HRESULT,
	SetAngle2:   proc "system" (this: ^IRotateTransform, angle: f32) -> HRESULT,
	SetCenterX:  proc "system" (this: ^IRotateTransform, animation: ^IAnimation) -> HRESULT,
	SetCenterX2: proc "system" (this: ^IRotateTransform, centerX: f32) -> HRESULT,
	SetCenterY:  proc "system" (this: ^IRotateTransform, animation: ^IAnimation) -> HRESULT,
	SetCenterY2: proc "system" (this: ^IRotateTransform, centerY: f32) -> HRESULT,
}

ISkewTransform_UUID_STRING :: "E57AA735-DCDB-4C72-9C61-0591F58889EE"
ISkewTransform_UUID := &IID{0xE57AA735, 0xDCDB, 0x4C72, {0x9C, 0x61, 0x05, 0x91, 0xF5, 0x88, 0x89, 0xEE}}
ISkewTransform :: struct #raw_union {
	#subtype idcompositiontransform: ITransform,
	using idcompositionskewtransform_vtable: ^ISkewTransform_VTable,
}
ISkewTransform_VTable :: struct {
	using idcompositiontransform_vtable: ITransform_VTable,
	SetAngleX:   proc "system" (this: ^ISkewTransform, animation: ^IAnimation) -> HRESULT,
	SetAngleX2:  proc "system" (this: ^ISkewTransform, angleX: f32) -> HRESULT,
	SetAngleY:   proc "system" (this: ^ISkewTransform, animation: ^IAnimation) -> HRESULT,
	SetAngleY2:  proc "system" (this: ^ISkewTransform, angleY: f32) -> HRESULT,
	SetCenterX:  proc "system" (this: ^ISkewTransform, animation: ^IAnimation) -> HRESULT,
	SetCenterX2: proc "system" (this: ^ISkewTransform, centerX: f32) -> HRESULT,
	SetCenterY:  proc "system" (this: ^ISkewTransform, animation: ^IAnimation) -> HRESULT,
	SetCenterY2: proc "system" (this: ^ISkewTransform, centerY: f32) -> HRESULT,
}

IMatrixTransform_UUID_STRING :: "16CDFF07-C503-419C-83F2-0965C7AF1FA6"
IMatrixTransform_UUID := &IID{0x16CDFF07, 0xC503, 0x419C, {0x83, 0xF2, 0x09, 0x65, 0xC7, 0xAF, 0x1F, 0xA6}}
IMatrixTransform :: struct #raw_union {
	#subtype idcompositiontransform: ITransform,
	using idcompositionmatrixtransform_vtable: ^IMatrixTransform_VTable,
}
IMatrixTransform_VTable :: struct {
	using idcompositiontransform_vtable: ITransform_VTable,
	SetMatrix:         proc "system" (this: ^IMatrixTransform, pMatrix: ^D2D_MATRIX_3X2_F) -> HRESULT,
	SetMatrixElement:  proc "system" (this: ^IMatrixTransform, row: i32, column: i32, animation: ^IAnimation) -> HRESULT,
	SetMatrixElement2: proc "system" (this: ^IMatrixTransform, row: i32, column: i32, value: f32) -> HRESULT,
}

IEffectGroup_UUID_STRING :: "A7929A74-E6B2-4BD6-8B95-4040119CA34D"
IEffectGroup_UUID := &IID{0xA7929A74, 0xE6B2, 0x4BD6, {0x8B, 0x95, 0x40, 0x40, 0x11, 0x9C, 0xA3, 0x4D}}
IEffectGroup :: struct #raw_union {
	#subtype idcompositioneffect: IEffect,
	using idcompositioneffectgroup_vtable: ^IEffectGroup_VTable,
}
IEffectGroup_VTable :: struct {
	using idcompositioneffect_vtable: IEffect_VTable,
	SetOpacity:     proc "system" (this: ^IEffectGroup, animation: ^IAnimation) -> HRESULT,
	SetOpacity2:    proc "system" (this: ^IEffectGroup, opacity: f32) -> HRESULT,
	SetTransform3D: proc "system" (this: ^IEffectGroup, transform3D: ^ITransform3D) -> HRESULT,
}

ITranslateTransform3D_UUID_STRING :: "91636D4B-9BA1-4532-AAF7-E3344994D788"
ITranslateTransform3D_UUID := &IID{0x91636D4B, 0x9BA1, 0x4532, {0xAA, 0xF7, 0xE3, 0x34, 0x49, 0x94, 0xD7, 0x88}}
ITranslateTransform3D :: struct #raw_union {
	#subtype idcompositiontransform3d: ITransform3D,
	using idcompositiontranslatetransform3d_vtable: ^ITranslateTransform3D_VTable,
}
ITranslateTransform3D_VTable :: struct {
	using idcompositiontransform3d_vtable: ITransform3D_VTable,
	SetOffsetX:  proc "system" (this: ^ITranslateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetOffsetX2: proc "system" (this: ^ITranslateTransform3D, offsetX: f32) -> HRESULT,
	SetOffsetY:  proc "system" (this: ^ITranslateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetOffsetY2: proc "system" (this: ^ITranslateTransform3D, offsetY: f32) -> HRESULT,
	SetOffsetZ:  proc "system" (this: ^ITranslateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetOffsetZ2: proc "system" (this: ^ITranslateTransform3D, offsetZ: f32) -> HRESULT,
}

IScaleTransform3D_UUID_STRING :: "2A9E9EAD-364B-4B15-A7C4-A1997F78B389"
IScaleTransform3D_UUID := &IID{0x2A9E9EAD, 0x364B, 0x4B15, {0xA7, 0xC4, 0xA1, 0x99, 0x7F, 0x78, 0xB3, 0x89}}
IScaleTransform3D :: struct #raw_union {
	#subtype idcompositiontransform3d: ITransform3D,
	using idcompositionscaletransform3d_vtable: ^IScaleTransform3D_VTable,
}
IScaleTransform3D_VTable :: struct {
	using idcompositiontransform3d_vtable: ITransform3D_VTable,
	SetScaleX:   proc "system" (this: ^IScaleTransform3D, animation: ^IAnimation) -> HRESULT,
	SetScaleX2:  proc "system" (this: ^IScaleTransform3D, scaleX: f32) -> HRESULT,
	SetScaleY:   proc "system" (this: ^IScaleTransform3D, animation: ^IAnimation) -> HRESULT,
	SetScaleY2:  proc "system" (this: ^IScaleTransform3D, scaleY: f32) -> HRESULT,
	SetScaleZ:   proc "system" (this: ^IScaleTransform3D, animation: ^IAnimation) -> HRESULT,
	SetScaleZ2:  proc "system" (this: ^IScaleTransform3D, scaleZ: f32) -> HRESULT,
	SetCenterX:  proc "system" (this: ^IScaleTransform3D, animation: ^IAnimation) -> HRESULT,
	SetCenterX2: proc "system" (this: ^IScaleTransform3D, centerX: f32) -> HRESULT,
	SetCenterY:  proc "system" (this: ^IScaleTransform3D, animation: ^IAnimation) -> HRESULT,
	SetCenterY2: proc "system" (this: ^IScaleTransform3D, centerY: f32) -> HRESULT,
	SetCenterZ:  proc "system" (this: ^IScaleTransform3D, animation: ^IAnimation) -> HRESULT,
	SetCenterZ2: proc "system" (this: ^IScaleTransform3D, centerZ: f32) -> HRESULT,
}

IRotateTransform3D_UUID_STRING :: "D8F5B23F-D429-4A91-B55A-D2F45FD75B18"
IRotateTransform3D_UUID := &IID{0xD8F5B23F, 0xD429, 0x4A91, {0xB5, 0x5A, 0xD2, 0xF4, 0x5F, 0xD7, 0x5B, 0x18}}
IRotateTransform3D :: struct #raw_union {
	#subtype idcompositiontransform3d: ITransform3D,
	using idcompositionrotatetransform3d_vtable: ^IRotateTransform3D_VTable,
}
IRotateTransform3D_VTable :: struct {
	using idcompositiontransform3d_vtable: ITransform3D_VTable,
	SetAngle:    proc "system" (this: ^IRotateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetAngle2:   proc "system" (this: ^IRotateTransform3D, angle: f32) -> HRESULT,
	SetAxisX:    proc "system" (this: ^IRotateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetAxisX2:   proc "system" (this: ^IRotateTransform3D, axisX: f32) -> HRESULT,
	SetAxisY:    proc "system" (this: ^IRotateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetAxisY2:   proc "system" (this: ^IRotateTransform3D, axisY: f32) -> HRESULT,
	SetAxisZ:    proc "system" (this: ^IRotateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetAxisZ2:   proc "system" (this: ^IRotateTransform3D, axisZ: f32) -> HRESULT,
	SetCenterX:  proc "system" (this: ^IRotateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetCenterX2: proc "system" (this: ^IRotateTransform3D, centerX: f32) -> HRESULT,
	SetCenterY:  proc "system" (this: ^IRotateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetCenterY2: proc "system" (this: ^IRotateTransform3D, centerY: f32) -> HRESULT,
	SetCenterZ:  proc "system" (this: ^IRotateTransform3D, animation: ^IAnimation) -> HRESULT,
	SetCenterZ2: proc "system" (this: ^IRotateTransform3D, centerZ: f32) -> HRESULT,
}

IMatrixTransform3D_UUID_STRING :: "4B3363F0-643B-41B7-B6E0-CCF22D34467C"
IMatrixTransform3D_UUID := &IID{0x4B3363F0, 0x643B, 0x41B7, {0xB6, 0xE0, 0xCC, 0xF2, 0x2D, 0x34, 0x46, 0x7C}}
IMatrixTransform3D :: struct #raw_union {
	#subtype idcompositiontransform3d: ITransform3D,
	using idcompositionmatrixtransform3d_vtable: ^IMatrixTransform3D_VTable,
}
IMatrixTransform3D_VTable :: struct {
	using idcompositiontransform3d_vtable: ITransform3D_VTable,
	SetMatrix:         proc "system" (this: ^IMatrixTransform3D, pMatrix: ^D3DMATRIX) -> HRESULT,
	SetMatrixElement:  proc "system" (this: ^IMatrixTransform3D, row: i32, column: i32, animation: ^IAnimation) -> HRESULT,
	SetMatrixElement2: proc "system" (this: ^IMatrixTransform3D, row: i32, column: i32, value: f32) -> HRESULT,
}

IClip_UUID_STRING :: "64AC3703-9D3F-45EC-A109-7CAC0E7A13A7"
IClip_UUID := &IID{0x64AC3703, 0x9D3F, 0x45EC, {0xA1, 0x09, 0x7C, 0xAC, 0x0E, 0x7A, 0x13, 0xA7}}
IClip :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositionclip_vtable: ^IClip_VTable,
}
IClip_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
}

IRectangleClip_UUID_STRING :: "9842AD7D-D9CF-4908-AED7-48B51DA5E7C2"
IRectangleClip_UUID := &IID{0x9842AD7D, 0xD9CF, 0x4908, {0xAE, 0xD7, 0x48, 0xB5, 0x1D, 0xA5, 0xE7, 0xC2}}
IRectangleClip :: struct #raw_union {
	#subtype idcompositionclip: IClip,
	using idcompositionrectangleclip_vtable: ^IRectangleClip_VTable,
}
IRectangleClip_VTable :: struct {
	using idcompositionclip_vtable: IClip_VTable,
	SetLeft:                proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetLeft2:               proc "system" (this: ^IRectangleClip, left: f32) -> HRESULT,
	SetTop:                 proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetTop2:                proc "system" (this: ^IRectangleClip, top: f32) -> HRESULT,
	SetRight:               proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetRight2:              proc "system" (this: ^IRectangleClip, right: f32) -> HRESULT,
	SetBottom:              proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetBottom2:             proc "system" (this: ^IRectangleClip, bottom: f32) -> HRESULT,
	SetTopLeftRadiusX:      proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetTopLeftRadiusX2:     proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
	SetTopLeftRadiusY:      proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetTopLeftRadiusY2:     proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
	SetTopRightRadiusX:     proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetTopRightRadiusX2:    proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
	SetTopRightRadiusY:     proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetTopRightRadiusY2:    proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
	SetBottomLeftRadiusX:   proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetBottomLeftRadiusX2:  proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
	SetBottomLeftRadiusY:   proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetBottomLeftRadiusY2:  proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
	SetBottomRightRadiusX:  proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetBottomRightRadiusX2: proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
	SetBottomRightRadiusY:  proc "system" (this: ^IRectangleClip, animation: ^IAnimation) -> HRESULT,
	SetBottomRightRadiusY2: proc "system" (this: ^IRectangleClip, radius: f32) -> HRESULT,
}

ISurface_UUID_STRING :: "BB8A4953-2C99-4F5A-96F5-4819027FA3AC"
ISurface_UUID := &IID{0xBB8A4953, 0x2C99, 0x4F5A, {0x96, 0xF5, 0x48, 0x19, 0x02, 0x7F, 0xA3, 0xAC}}
ISurface :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositionsurface_vtable: ^ISurface_VTable,
}
ISurface_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	BeginDraw:   proc "system" (this: ^ISurface, updateRect: ^RECT, iid: ^IID, updateObject: ^rawptr, updateOffset: ^POINT) -> HRESULT,
	EndDraw:     proc "system" (this: ^ISurface) -> HRESULT,
	SuspendDraw: proc "system" (this: ^ISurface) -> HRESULT,
	ResumeDraw:  proc "system" (this: ^ISurface) -> HRESULT,
	Scroll:      proc "system" (this: ^ISurface, scrollRect: ^RECT, clipRect: ^RECT, offsetX: i32, offsetY: i32) -> HRESULT,
}

IVirtualSurface_UUID_STRING :: "AE471C51-5F53-4A24-8D3E-D0C39C30B3F0"
IVirtualSurface_UUID := &IID{0xAE471C51, 0x5F53, 0x4A24, {0x8D, 0x3E, 0xD0, 0xC3, 0x9C, 0x30, 0xB3, 0xF0}}
IVirtualSurface :: struct #raw_union {
	#subtype idcompositionsurface: ISurface,
	using idcompositionvirtualsurface_vtable: ^IVirtualSurface_VTable,
}
IVirtualSurface_VTable :: struct {
	using idcompositionsurface_vtable: ISurface_VTable,
	Resize: proc "system" (this: ^IVirtualSurface, width: u32, height: u32) -> HRESULT,
	Trim:   proc "system" (this: ^IVirtualSurface, rectangles: [^]RECT, count: u32) -> HRESULT,
}


IDevice2_UUID_STRING :: "75F6468D-1B8E-447C-9BC6-75FEA80B5B25"
IDevice2_UUID := &IID{0x75F6468D, 0x1B8E, 0x447C, {0x9B, 0xC6, 0x75, 0xFE, 0xA8, 0x0B, 0x5B, 0x25}}
IDevice2 :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositiondevice2_vtable: ^IDevice2_VTable,
}
IDevice2_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	Commit:                     proc "system" (this: ^IDevice2) -> HRESULT,
	WaitForCommitCompletion:    proc "system" (this: ^IDevice2) -> HRESULT,
	GetFrameStatistics:         proc "system" (this: ^IDevice2, statistics: ^FRAME_STATISTICS) -> HRESULT,
	CreateVisual:               proc "system" (this: ^IDevice2, visual: ^^IVisual2) -> HRESULT,
	CreateSurfaceFactory:       proc "system" (this: ^IDevice2, renderingDevice: ^IUnknown, surfaceFactory: ^^ISurfaceFactory) -> HRESULT,
	CreateSurface:              proc "system" (this: ^IDevice2, width: u32, height: u32, pixelFormat: dxgi.FORMAT, alphaMode: dxgi.ALPHA_MODE, surface: ^^ISurface) -> HRESULT,
	CreateVirtualSurface:       proc "system" (this: ^IDevice2, initialWidth: u32, initialHeight: u32, pixelFormat: dxgi.FORMAT, alphaMode: dxgi.ALPHA_MODE, virtualSurface: ^^IVirtualSurface) -> HRESULT,
	CreateTranslateTransform:   proc "system" (this: ^IDevice2, translateTransform: ^^ITranslateTransform) -> HRESULT,
	CreateScaleTransform:       proc "system" (this: ^IDevice2, scaleTransform: ^^IScaleTransform) -> HRESULT,
	CreateRotateTransform:      proc "system" (this: ^IDevice2, rotateTransform: ^^IRotateTransform) -> HRESULT,
	CreateSkewTransform:        proc "system" (this: ^IDevice2, skewTransform: ^^ISkewTransform) -> HRESULT,
	CreateMatrixTransform:      proc "system" (this: ^IDevice2, matrixTransform: ^^IMatrixTransform) -> HRESULT,
	CreateTransformGroup:       proc "system" (this: ^IDevice2, transforms: [^]^ITransform, elements: u32, transformGroup: ^^ITransform) -> HRESULT,
	CreateTranslateTransform3D: proc "system" (this: ^IDevice2, translateTransform3D: ^^ITranslateTransform3D) -> HRESULT,
	CreateScaleTransform3D:     proc "system" (this: ^IDevice2, scaleTransform3D: ^^IScaleTransform3D) -> HRESULT,
	CreateRotateTransform3D:    proc "system" (this: ^IDevice2, rotateTransform3D: ^^IRotateTransform3D) -> HRESULT,
	CreateMatrixTransform3D:    proc "system" (this: ^IDevice2, matrixTransform3D: ^^IMatrixTransform3D) -> HRESULT,
	CreateTransform3DGroup:     proc "system" (this: ^IDevice2, transforms3D: [^]^ITransform3D, elements: u32, transform3DGroup: ^^ITransform3D) -> HRESULT,
	CreateEffectGroup:          proc "system" (this: ^IDevice2, effectGroup: ^^IEffectGroup) -> HRESULT,
	CreateRectangleClip:        proc "system" (this: ^IDevice2, clip: ^^IRectangleClip) -> HRESULT,
	CreateAnimation:            proc "system" (this: ^IDevice2, animation: ^^IAnimation) -> HRESULT,
}

IDesktopDevice_UUID_STRING :: "5F4633FE-1E08-4CB8-8C75-CE24333F5602"
IDesktopDevice_UUID := &IID{0x5F4633FE, 0x1E08, 0x4CB8, {0x8C, 0x75, 0xCE, 0x24, 0x33, 0x3F, 0x56, 0x02}}
IDesktopDevice :: struct #raw_union {
	#subtype idcompositiondevice2: IDevice2,
	using idcompositiondesktopdevice_vtable: ^IDesktopDevice_VTable,
}
IDesktopDevice_VTable :: struct {
	using idcompositiondevice2_vtable: IDevice2_VTable,
	CreateTargetForHwnd:     proc "system" (this: ^IDesktopDevice, hwnd: HWND, topmost: BOOL, target: ^^ITarget) -> HRESULT,
	CreateSurfaceFromHandle: proc "system" (this: ^IDesktopDevice, handle: HANDLE, surface: ^^IUnknown) -> HRESULT,
	CreateSurfaceFromHwnd:   proc "system" (this: ^IDesktopDevice, hwnd: HWND, surface: ^^IUnknown) -> HRESULT,
}

IDeviceDebug_UUID_STRING :: "A1A3C64A-224F-4A81-9773-4F03A89D3C6C"
IDeviceDebug_UUID := &IID{0xA1A3C64A, 0x224F, 0x4A81, {0x97, 0x73, 0x4F, 0x03, 0xA8, 0x9D, 0x3C, 0x6C}}
IDeviceDebug :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositiondevicedebug_vtable: ^IDeviceDebug_VTable,
}
IDeviceDebug_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	EnableDebugCounters:  proc "system" (this: ^IDeviceDebug) -> HRESULT,
	DisableDebugCounters: proc "system" (this: ^IDeviceDebug) -> HRESULT,
}

ISurfaceFactory_UUID_STRING :: "E334BC12-3937-4E02-85EB-FCF4EB30D2C8"
ISurfaceFactory_UUID := &IID{0xE334BC12, 0x3937, 0x4E02, {0x85, 0xEB, 0xFC, 0xF4, 0xEB, 0x30, 0xD2, 0xC8}}
ISurfaceFactory :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositionsurfacefactory_vtable: ^ISurfaceFactory_VTable,
}
ISurfaceFactory_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	CreateSurface:        proc "system" (this: ^ISurfaceFactory, width: u32, height: u32, pixelFormat: dxgi.FORMAT, alphaMode: dxgi.ALPHA_MODE, surface: ^^ISurface) -> HRESULT,
	CreateVirtualSurface: proc "system" (this: ^ISurfaceFactory, initialWidth: u32, initialHeight: u32, pixelFormat: dxgi.FORMAT, alphaMode: dxgi.ALPHA_MODE, virtualSurface: ^^IVirtualSurface) -> HRESULT,
}

IVisual2_UUID_STRING :: "E8DE1639-4331-4B26-BC5F-6A321D347A85"
IVisual2_UUID := &IID{0xE8DE1639, 0x4331, 0x4B26, {0xBC, 0x5F, 0x6A, 0x32, 0x1D, 0x34, 0x7A, 0x85}}
IVisual2 :: struct #raw_union {
	#subtype idcompositionvisual: IVisual,
	using idcompositionvisual2_vtable: ^IVisual2_VTable,
}
IVisual2_VTable :: struct {
	using idcompositionvisual_vtable: IVisual_VTable,
	SetOpacityMode:        proc "system" (this: ^IVisual2, mode: OPACITY_MODE) -> HRESULT,
	SetBackFaceVisibility: proc "system" (this: ^IVisual2, visibility: BACKFACE_VISIBILITY) -> HRESULT,
}

IVisualDebug_UUID_STRING :: "FED2B808-5EB4-43A0-AEA3-35F65280F91B"
IVisualDebug_UUID := &IID{0xFED2B808, 0x5EB4, 0x43A0, {0xAE, 0xA3, 0x35, 0xF6, 0x52, 0x80, 0xF9, 0x1B}}
IVisualDebug :: struct #raw_union {
	#subtype idcompositionvisual2: IVisual2,
	using idcompositionvisualdebug_vtable: ^IVisualDebug_VTable,
}
IVisualDebug_VTable :: struct {
	using idcompositionvisual2_vtable: IVisual2_VTable,
	EnableHeatMap:        proc "system" (this: ^IVisualDebug, color: ^D2D1_COLOR_F) -> HRESULT,
	DisableHeatMap:       proc "system" (this: ^IVisualDebug) -> HRESULT,
	EnableRedrawRegions:  proc "system" (this: ^IVisualDebug) -> HRESULT,
	DisableRedrawRegions: proc "system" (this: ^IVisualDebug) -> HRESULT,
}


IVisual3_UUID_STRING :: "2775F462-B6C1-4015-B0BE-B3E7D6A4976D"
IVisual3_UUID := &IID{0x2775F462, 0xB6C1, 0x4015, {0xB0, 0xBE, 0xB3, 0xE7, 0xD6, 0xA4, 0x97, 0x6D}}
IVisual3 :: struct #raw_union {
	#subtype idcompositionvisualdebug: IVisualDebug,
	using idcompositionvisual3_vtable: ^IVisual3_VTable,
}
IVisual3_VTable :: struct {
	using idcompositionvisualdebug_vtable: IVisualDebug_VTable,
	SetDepthMode:  proc "system" (this: ^IVisual3, mode: DEPTH_MODE) -> HRESULT,
	SetOffsetZ:    proc "system" (this: ^IVisual3, animation: ^IAnimation) -> HRESULT,
	SetOffsetZ2:   proc "system" (this: ^IVisual3, offsetZ: f32) -> HRESULT,
	SetOpacity:    proc "system" (this: ^IVisual3, animation: ^IAnimation) -> HRESULT,
	SetOpacity2:   proc "system" (this: ^IVisual3, opacity: f32) -> HRESULT,
	SetTransform3: proc "system" (this: ^IVisual3, transform: ^ITransform3D) -> HRESULT,
	SetTransform4: proc "system" (this: ^IVisual3, pMatrix: ^D2D_MATRIX_4X4_F) -> HRESULT,
	SetVisible:    proc "system" (this: ^IVisual3, visible: BOOL) -> HRESULT,
}

IDevice3_UUID_STRING :: "0987CB06-F916-48BF-8D35-CE7641781BD9"
IDevice3_UUID := &IID{0x0987CB06, 0xF916, 0x48BF, {0x8D, 0x35, 0xCE, 0x76, 0x41, 0x78, 0x1B, 0xD9}}
IDevice3 :: struct #raw_union {
	#subtype idcompositiondevice2: IDevice2,
	using idcompositiondevice3_vtable: ^IDevice3_VTable,
}
IDevice3_VTable :: struct {
	using idcompositiondevice2_vtable: IDevice2_VTable,
	CreateGaussianBlurEffect:        proc "system" (this: ^IDevice3, gaussianBlurEffect: ^^IGaussianBlurEffect) -> HRESULT,
	CreateBrightnessEffect:          proc "system" (this: ^IDevice3, brightnessEffect: ^^IBrightnessEffect) -> HRESULT,
	CreateColorMatrixEffect:         proc "system" (this: ^IDevice3, colorMatrixEffect: ^^IColorMatrixEffect) -> HRESULT,
	CreateShadowEffect:              proc "system" (this: ^IDevice3, shadowEffect: ^^IShadowEffect) -> HRESULT,
	CreateHueRotationEffect:         proc "system" (this: ^IDevice3, hueRotationEffect: ^^IHueRotationEffect) -> HRESULT,
	CreateSaturationEffect:          proc "system" (this: ^IDevice3, saturationEffect: ^^ISaturationEffect) -> HRESULT,
	CreateTurbulenceEffect:          proc "system" (this: ^IDevice3, turbulenceEffect: ^^ITurbulenceEffect) -> HRESULT,
	CreateLinearTransferEffect:      proc "system" (this: ^IDevice3, linearTransferEffect: ^^ILinearTransferEffect) -> HRESULT,
	CreateTableTransferEffect:       proc "system" (this: ^IDevice3, tableTransferEffect: ^^ITableTransferEffect) -> HRESULT,
	CreateCompositeEffect:           proc "system" (this: ^IDevice3, compositeEffect: ^^ICompositeEffect) -> HRESULT,
	CreateBlendEffect:               proc "system" (this: ^IDevice3, blendEffect: ^^IBlendEffect) -> HRESULT,
	CreateArithmeticCompositeEffect: proc "system" (this: ^IDevice3, arithmeticCompositeEffect: ^^IArithmeticCompositeEffect) -> HRESULT,
	CreateAffineTransform2DEffect:   proc "system" (this: ^IDevice3, affineTransform2dEffect: ^^IAffineTransform2DEffect) -> HRESULT,
}

IFilterEffect_UUID_STRING :: "30C421D5-8CB2-4E9F-B133-37BE270D4AC2"
IFilterEffect_UUID := &IID{0x30C421D5, 0x8CB2, 0x4E9F, {0xB1, 0x33, 0x37, 0xBE, 0x27, 0x0D, 0x4A, 0xC2}}
IFilterEffect :: struct #raw_union {
	#subtype idcompositioneffect: IEffect,
	using idcompositionfiltereffect_vtable: ^IFilterEffect_VTable,
}
IFilterEffect_VTable :: struct {
	using idcompositioneffect_vtable: IEffect_VTable,
	SetInput: proc "system" (this: ^IFilterEffect, index: u32, input: ^IUnknown, flags: u32) -> HRESULT,
}

IGaussianBlurEffect_UUID_STRING :: "45D4D0B7-1BD4-454E-8894-2BFA68443033"
IGaussianBlurEffect_UUID := &IID{0x45D4D0B7, 0x1BD4, 0x454E, {0x88, 0x94, 0x2B, 0xFA, 0x68, 0x44, 0x30, 0x33}}
IGaussianBlurEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositiongaussianblureffect_vtable: ^IGaussianBlurEffect_VTable,
}
IGaussianBlurEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetStandardDeviation:  proc "system" (this: ^IGaussianBlurEffect, animation: ^IAnimation) -> HRESULT,
	SetStandardDeviation2: proc "system" (this: ^IGaussianBlurEffect, amount: f32) -> HRESULT,
	SetBorderMode:         proc "system" (this: ^IGaussianBlurEffect, mode: D2D1_BORDER_MODE) -> HRESULT,
}

IBrightnessEffect_UUID_STRING :: "6027496E-CB3A-49AB-934F-D798DA4F7DA6"
IBrightnessEffect_UUID := &IID{0x6027496E, 0xCB3A, 0x49AB, {0x93, 0x4F, 0xD7, 0x98, 0xDA, 0x4F, 0x7D, 0xA6}}
IBrightnessEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionbrightnesseffect_vtable: ^IBrightnessEffect_VTable,
}
IBrightnessEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetWhitePoint:   proc "system" (this: ^IBrightnessEffect, whitePoint: ^D2D1_VECTOR_2F) -> HRESULT,
	SetBlackPoint:   proc "system" (this: ^IBrightnessEffect, blackPoint: ^D2D1_VECTOR_2F) -> HRESULT,
	SetWhitePointX:  proc "system" (this: ^IBrightnessEffect, animation: ^IAnimation) -> HRESULT,
	SetWhitePointX2: proc "system" (this: ^IBrightnessEffect, whitePointX: f32) -> HRESULT,
	SetWhitePointY:  proc "system" (this: ^IBrightnessEffect, animation: ^IAnimation) -> HRESULT,
	SetWhitePointY2: proc "system" (this: ^IBrightnessEffect, whitePointY: f32) -> HRESULT,
	SetBlackPointX:  proc "system" (this: ^IBrightnessEffect, animation: ^IAnimation) -> HRESULT,
	SetBlackPointX2: proc "system" (this: ^IBrightnessEffect, blackPointX: f32) -> HRESULT,
	SetBlackPointY:  proc "system" (this: ^IBrightnessEffect, animation: ^IAnimation) -> HRESULT,
	SetBlackPointY2: proc "system" (this: ^IBrightnessEffect, blackPointY: f32) -> HRESULT,
}

IColorMatrixEffect_UUID_STRING :: "C1170A22-3CE2-4966-90D4-55408BFC84C4"
IColorMatrixEffect_UUID := &IID{0xC1170A22, 0x3CE2, 0x4966, {0x90, 0xD4, 0x55, 0x40, 0x8B, 0xFC, 0x84, 0xC4}}
IColorMatrixEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositioncolormatrixeffect_vtable: ^IColorMatrixEffect_VTable,
}
IColorMatrixEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetMatrix:         proc "system" (this: ^IColorMatrixEffect, pMatrix: ^D2D1_MATRIX_5X4_F) -> HRESULT,
	SetMatrixElement:  proc "system" (this: ^IColorMatrixEffect, row: i32, column: i32, animation: ^IAnimation) -> HRESULT,
	SetMatrixElement2: proc "system" (this: ^IColorMatrixEffect, row: i32, column: i32, value: f32) -> HRESULT,
	SetAlphaMode:      proc "system" (this: ^IColorMatrixEffect, mode: D2D1_COLORMATRIX_ALPHA_MODE) -> HRESULT,
	SetClampOutput:    proc "system" (this: ^IColorMatrixEffect, clamp: BOOL) -> HRESULT,
}

IShadowEffect_UUID_STRING :: "4AD18AC0-CFD2-4C2F-BB62-96E54FDB6879"
IShadowEffect_UUID := &IID{0x4AD18AC0, 0xCFD2, 0x4C2F, {0xBB, 0x62, 0x96, 0xE5, 0x4F, 0xDB, 0x68, 0x79}}
IShadowEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionshadoweffect_vtable: ^IShadowEffect_VTable,
}
IShadowEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetStandardDeviation:  proc "system" (this: ^IShadowEffect, animation: ^IAnimation) -> HRESULT,
	SetStandardDeviation2: proc "system" (this: ^IShadowEffect, amount: f32) -> HRESULT,
	SetColor:              proc "system" (this: ^IShadowEffect, color: ^D2D1_VECTOR_4F) -> HRESULT,
	SetRed:                proc "system" (this: ^IShadowEffect, animation: ^IAnimation) -> HRESULT,
	SetRed2:               proc "system" (this: ^IShadowEffect, amount: f32) -> HRESULT,
	SetGreen:              proc "system" (this: ^IShadowEffect, animation: ^IAnimation) -> HRESULT,
	SetGreen2:             proc "system" (this: ^IShadowEffect, amount: f32) -> HRESULT,
	SetBlue:               proc "system" (this: ^IShadowEffect, animation: ^IAnimation) -> HRESULT,
	SetBlue2:              proc "system" (this: ^IShadowEffect, amount: f32) -> HRESULT,
	SetAlpha:              proc "system" (this: ^IShadowEffect, animation: ^IAnimation) -> HRESULT,
	SetAlpha2:             proc "system" (this: ^IShadowEffect, amount: f32) -> HRESULT,
}

IHueRotationEffect_UUID_STRING :: "6DB9F920-0770-4781-B0C6-381912F9D167"
IHueRotationEffect_UUID := &IID{0x6DB9F920, 0x0770, 0x4781, {0xB0, 0xC6, 0x38, 0x19, 0x12, 0xF9, 0xD1, 0x67}}
IHueRotationEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionhuerotationeffect_vtable: ^IHueRotationEffect_VTable,
}
IHueRotationEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetAngle:  proc "system" (this: ^IHueRotationEffect, animation: ^IAnimation) -> HRESULT,
	SetAngle2: proc "system" (this: ^IHueRotationEffect, amountDegrees: f32) -> HRESULT,
}

ISaturationEffect_UUID_STRING :: "A08DEBDA-3258-4FA4-9F16-9174D3FE93B1"
ISaturationEffect_UUID := &IID{0xA08DEBDA, 0x3258, 0x4FA4, {0x9F, 0x16, 0x91, 0x74, 0xD3, 0xFE, 0x93, 0xB1}}
ISaturationEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionsaturationeffect_vtable: ^ISaturationEffect_VTable,
}
ISaturationEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetSaturation:  proc "system" (this: ^ISaturationEffect, animation: ^IAnimation) -> HRESULT,
	SetSaturation2: proc "system" (this: ^ISaturationEffect, ratio: f32) -> HRESULT,
}

ITurbulenceEffect_UUID_STRING :: "A6A55BDA-C09C-49F3-9193-A41922C89715"
ITurbulenceEffect_UUID := &IID{0xA6A55BDA, 0xC09C, 0x49F3, {0x91, 0x93, 0xA4, 0x19, 0x22, 0xC8, 0x97, 0x15}}
ITurbulenceEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionturbulenceeffect_vtable: ^ITurbulenceEffect_VTable,
}
ITurbulenceEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetOffset:        proc "system" (this: ^ITurbulenceEffect, offset: ^D2D1_VECTOR_2F) -> HRESULT,
	SetBaseFrequency: proc "system" (this: ^ITurbulenceEffect, frequency: ^D2D1_VECTOR_2F) -> HRESULT,
	SetSize:          proc "system" (this: ^ITurbulenceEffect, size: ^D2D1_VECTOR_2F) -> HRESULT,
	SetNumOctaves:    proc "system" (this: ^ITurbulenceEffect, numOctaves: u32) -> HRESULT,
	SetSeed:          proc "system" (this: ^ITurbulenceEffect, seed: u32) -> HRESULT,
	SetNoise:         proc "system" (this: ^ITurbulenceEffect, noise: D2D1_TURBULENCE_NOISE) -> HRESULT,
	SetStitchable:    proc "system" (this: ^ITurbulenceEffect, stitchable: BOOL) -> HRESULT,
}

ILinearTransferEffect_UUID_STRING :: "4305EE5B-C4A0-4C88-9385-67124E017683"
ILinearTransferEffect_UUID := &IID{0x4305EE5B, 0xC4A0, 0x4C88, {0x93, 0x85, 0x67, 0x12, 0x4E, 0x01, 0x76, 0x83}}
ILinearTransferEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionlineartransfereffect_vtable: ^ILinearTransferEffect_VTable,
}
ILinearTransferEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetRedYIntercept:    proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetRedYIntercept2:   proc "system" (this: ^ILinearTransferEffect, redYIntercept: f32) -> HRESULT,
	SetRedSlope:         proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetRedSlope2:        proc "system" (this: ^ILinearTransferEffect, redSlope: f32) -> HRESULT,
	SetRedDisable:       proc "system" (this: ^ILinearTransferEffect, redDisable: BOOL) -> HRESULT,
	SetGreenYIntercept:  proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetGreenYIntercept2: proc "system" (this: ^ILinearTransferEffect, greenYIntercept: f32) -> HRESULT,
	SetGreenSlope:       proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetGreenSlope2:      proc "system" (this: ^ILinearTransferEffect, greenSlope: f32) -> HRESULT,
	SetGreenDisable:     proc "system" (this: ^ILinearTransferEffect, greenDisable: BOOL) -> HRESULT,
	SetBlueYIntercept:   proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetBlueYIntercept2:  proc "system" (this: ^ILinearTransferEffect, blueYIntercept: f32) -> HRESULT,
	SetBlueSlope:        proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetBlueSlope2:       proc "system" (this: ^ILinearTransferEffect, blueSlope: f32) -> HRESULT,
	SetBlueDisable:      proc "system" (this: ^ILinearTransferEffect, blueDisable: BOOL) -> HRESULT,
	SetAlphaYIntercept:  proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetAlphaYIntercept2: proc "system" (this: ^ILinearTransferEffect, alphaYIntercept: f32) -> HRESULT,
	SetAlphaSlope:       proc "system" (this: ^ILinearTransferEffect, animation: ^IAnimation) -> HRESULT,
	SetAlphaSlope2:      proc "system" (this: ^ILinearTransferEffect, alphaSlope: f32) -> HRESULT,
	SetAlphaDisable:     proc "system" (this: ^ILinearTransferEffect, alphaDisable: BOOL) -> HRESULT,
	SetClampOutput:      proc "system" (this: ^ILinearTransferEffect, clampOutput: BOOL) -> HRESULT,
}

ITableTransferEffect_UUID_STRING :: "9B7E82E2-69C5-4EB4-A5F5-A7033F5132CD"
ITableTransferEffect_UUID := &IID{0x9B7E82E2, 0x69C5, 0x4EB4, {0xA5, 0xF5, 0xA7, 0x03, 0x3F, 0x51, 0x32, 0xCD}}
ITableTransferEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositiontabletransfereffect_vtable: ^ITableTransferEffect_VTable,
}
ITableTransferEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetRedTable:         proc "system" (this: ^ITableTransferEffect, tableValues: [^]f32, count: u32) -> HRESULT,
	SetGreenTable:       proc "system" (this: ^ITableTransferEffect, tableValues: [^]f32, count: u32) -> HRESULT,
	SetBlueTable:        proc "system" (this: ^ITableTransferEffect, tableValues: [^]f32, count: u32) -> HRESULT,
	SetAlphaTable:       proc "system" (this: ^ITableTransferEffect, tableValues: [^]f32, count: u32) -> HRESULT,
	SetRedDisable:       proc "system" (this: ^ITableTransferEffect, redDisable: BOOL) -> HRESULT,
	SetGreenDisable:     proc "system" (this: ^ITableTransferEffect, greenDisable: BOOL) -> HRESULT,
	SetBlueDisable:      proc "system" (this: ^ITableTransferEffect, blueDisable: BOOL) -> HRESULT,
	SetAlphaDisable:     proc "system" (this: ^ITableTransferEffect, alphaDisable: BOOL) -> HRESULT,
	SetClampOutput:      proc "system" (this: ^ITableTransferEffect, clampOutput: BOOL) -> HRESULT,
	SetRedTableValue:    proc "system" (this: ^ITableTransferEffect, index: u32, animation: ^IAnimation) -> HRESULT,
	SetRedTableValue2:   proc "system" (this: ^ITableTransferEffect, index: u32, value: f32) -> HRESULT,
	SetGreenTableValue:  proc "system" (this: ^ITableTransferEffect, index: u32, animation: ^IAnimation) -> HRESULT,
	SetGreenTableValue2: proc "system" (this: ^ITableTransferEffect, index: u32, value: f32) -> HRESULT,
	SetBlueTableValue:   proc "system" (this: ^ITableTransferEffect, index: u32, animation: ^IAnimation) -> HRESULT,
	SetBlueTableValue2:  proc "system" (this: ^ITableTransferEffect, index: u32, value: f32) -> HRESULT,
	SetAlphaTableValue:  proc "system" (this: ^ITableTransferEffect, index: u32, animation: ^IAnimation) -> HRESULT,
	SetAlphaTableValue2: proc "system" (this: ^ITableTransferEffect, index: u32, value: f32) -> HRESULT,
}

ICompositeEffect_UUID_STRING :: "576616C0-A231-494D-A38D-00FD5EC4DB46"
ICompositeEffect_UUID := &IID{0x576616C0, 0xA231, 0x494D, {0xA3, 0x8D, 0x00, 0xFD, 0x5E, 0xC4, 0xDB, 0x46}}
ICompositeEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositioncompositeeffect_vtable: ^ICompositeEffect_VTable,
}
ICompositeEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetMode: proc "system" (this: ^ICompositeEffect, mode: D2D1_COMPOSITE_MODE) -> HRESULT,
}

IBlendEffect_UUID_STRING :: "33ECDC0A-578A-4A11-9C14-0CB90517F9C5"
IBlendEffect_UUID := &IID{0x33ECDC0A, 0x578A, 0x4A11, {0x9C, 0x14, 0x0C, 0xB9, 0x05, 0x17, 0xF9, 0xC5}}
IBlendEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionblendeffect_vtable: ^IBlendEffect_VTable,
}
IBlendEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetMode: proc "system" (this: ^IBlendEffect, mode: D2D1_BLEND_MODE) -> HRESULT,
}

IArithmeticCompositeEffect_UUID_STRING :: "3B67DFA8-E3DD-4E61-B640-46C2F3D739DC"
IArithmeticCompositeEffect_UUID := &IID{0x3B67DFA8, 0xE3DD, 0x4E61, {0xB6, 0x40, 0x46, 0xC2, 0xF3, 0xD7, 0x39, 0xDC}}
IArithmeticCompositeEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionarithmeticcompositeeffect_vtable: ^IArithmeticCompositeEffect_VTable,
}
IArithmeticCompositeEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetCoefficients:  proc "system" (this: ^IArithmeticCompositeEffect, coefficients: ^D2D1_VECTOR_4F) -> HRESULT,
	SetClampOutput:   proc "system" (this: ^IArithmeticCompositeEffect, clampoutput: BOOL) -> HRESULT,
	SetCoefficient1:  proc "system" (this: ^IArithmeticCompositeEffect, animation: ^IAnimation) -> HRESULT,
	SetCoefficient12: proc "system" (this: ^IArithmeticCompositeEffect, Coeffcient1: f32) -> HRESULT,
	SetCoefficient2:  proc "system" (this: ^IArithmeticCompositeEffect, animation: ^IAnimation) -> HRESULT,
	SetCoefficient22: proc "system" (this: ^IArithmeticCompositeEffect, Coefficient2: f32) -> HRESULT,
	SetCoefficient3:  proc "system" (this: ^IArithmeticCompositeEffect, animation: ^IAnimation) -> HRESULT,
	SetCoefficient32: proc "system" (this: ^IArithmeticCompositeEffect, Coefficient3: f32) -> HRESULT,
	SetCoefficient4:  proc "system" (this: ^IArithmeticCompositeEffect, animation: ^IAnimation) -> HRESULT,
	SetCoefficient42: proc "system" (this: ^IArithmeticCompositeEffect, Coefficient4: f32) -> HRESULT,
}

IAffineTransform2DEffect_UUID_STRING :: "0B74B9E8-CDD6-492F-BBBC-5ED32157026D"
IAffineTransform2DEffect_UUID := &IID{0x0B74B9E8, 0xCDD6, 0x492F, {0xBB, 0xBC, 0x5E, 0xD3, 0x21, 0x57, 0x02, 0x6D}}
IAffineTransform2DEffect :: struct #raw_union {
	#subtype idcompositionfiltereffect: IFilterEffect,
	using idcompositionaffinetransform2deffect_vtable: ^IAffineTransform2DEffect_VTable,
}
IAffineTransform2DEffect_VTable :: struct {
	using idcompositionfiltereffect_vtable: IFilterEffect_VTable,
	SetInterpolationMode:       proc "system" (this: ^IAffineTransform2DEffect, interpolationMode: D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE) -> HRESULT,
	SetBorderMode:              proc "system" (this: ^IAffineTransform2DEffect, borderMode: D2D1_BORDER_MODE) -> HRESULT,
	SetTransformMatrix:         proc "system" (this: ^IAffineTransform2DEffect, transformMatrix: ^D2D1_MATRIX_3X2_F) -> HRESULT,
	SetTransformMatrixElement:  proc "system" (this: ^IAffineTransform2DEffect, row: i32, column: i32, animation: ^IAnimation) -> HRESULT,
	SetTransformMatrixElement2: proc "system" (this: ^IAffineTransform2DEffect, row: i32, column: i32, value: f32) -> HRESULT,
	SetSharpness:               proc "system" (this: ^IAffineTransform2DEffect, animation: ^IAnimation) -> HRESULT,
	SetSharpness2:              proc "system" (this: ^IAffineTransform2DEffect, sharpness: f32) -> HRESULT,
}

InkTrailPoint :: struct {
	x:      f32,
	y:      f32,
	radius: f32,
}

IDelegatedInkTrail_UUID_STRING :: "C2448E9B-547D-4057-8CF5-8144EDE1C2DA"
IDelegatedInkTrail_UUID := &IID{0xC2448E9B, 0x547D, 0x4057, {0x8C, 0xF5, 0x81, 0x44, 0xED, 0xE1, 0xC2, 0xDA}}
IDelegatedInkTrail :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositiondelegatedinktrail_vtable: ^IDelegatedInkTrail_VTable,
}
IDelegatedInkTrail_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AddTrailPoints:               proc "system" (this: ^IDelegatedInkTrail, inkPoints: [^]InkTrailPoint, inkPointsCount: u32, generationId: ^u32) -> HRESULT,
	AddTrailPointsWithPrediction: proc "system" (this: ^IDelegatedInkTrail, inkPoints: [^]InkTrailPoint, inkPointsCount: u32, predictedInkPoints: [^]InkTrailPoint, predictedInkPointsCount: u32, generationId: ^u32) -> HRESULT,
	RemoveTrailPoints:            proc "system" (this: ^IDelegatedInkTrail, generationId: u32) -> HRESULT,
	StartNewTrail:                proc "system" (this: ^IDelegatedInkTrail, color: ^D2D1_COLOR_F) -> HRESULT,
}

IInkTrailDevice_UUID_STRING :: "DF0C7CEC-CDEB-4D4A-B91C-721BF22F4E6C"
IInkTrailDevice_UUID := &IID{0xDF0C7CEC, 0xCDEB, 0x4D4A, {0xB9, 0x1C, 0x72, 0x1B, 0xF2, 0x2F, 0x4E, 0x6C}}
IInkTrailDevice :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositioninktraildevice_vtable: ^IInkTrailDevice_VTable,
}
IInkTrailDevice_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	CreateDelegatedInkTrail:             proc "system" (this: ^IInkTrailDevice, inkTrail: ^^IDelegatedInkTrail) -> HRESULT,
	CreateDelegatedInkTrailForSwapChain: proc "system" (this: ^IInkTrailDevice, swapChain: ^IUnknown, inkTrail: ^^IDelegatedInkTrail) -> HRESULT,
}


ITexture_UUID_STRING :: "929BB1AA-725F-433B-ABD7-273075A835F2"
ITexture_UUID := &IID{0x929BB1AA, 0x725F, 0x433B, {0xAB, 0xD7, 0x27, 0x30, 0x75, 0xA8, 0x35, 0xF2}}
ITexture :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositiontexture_vtable: ^ITexture_VTable,
}
ITexture_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetSourceRect:     proc "system" (this: ^ITexture, sourceRect: ^D2D_RECT_U) -> HRESULT,
	SetColorSpace:     proc "system" (this: ^ITexture, colorSpace: dxgi.COLOR_SPACE_TYPE) -> HRESULT,
	SetAlphaMode:      proc "system" (this: ^ITexture, alphaMode: dxgi.ALPHA_MODE) -> HRESULT,
	GetAvailableFence: proc "system" (this: ^ITexture, fenceValue: ^u64, iid: ^IID, availableFence: ^rawptr) -> HRESULT,
}

IDevice4_UUID_STRING :: "85FC5CCA-2DA6-494C-86B6-4A775C049B8A"
IDevice4_UUID := &IID{0x85FC5CCA, 0x2DA6, 0x494C, {0x86, 0xB6, 0x4A, 0x77, 0x5C, 0x04, 0x9B, 0x8A}}
IDevice4 :: struct #raw_union {
	#subtype idcompositiondevice3: IDevice3,
	using idcompositiondevice4_vtable: ^IDevice4_VTable,
}
IDevice4_VTable :: struct {
	using idcompositiondevice3_vtable: IDevice3_VTable,
	CheckCompositionTextureSupport: proc "system" (this: ^IDevice4, renderingDevice: ^IUnknown, supportsCompositionTextures: ^BOOL) -> HRESULT,
	CreateCompositionTexture:       proc "system" (this: ^IDevice4, d3dTexture: ^IUnknown, compositionTexture: ^^ITexture) -> HRESULT,
}


IDynamicTexture_UUID_STRING :: "A1DE1D3F-6405-447F-8E95-1383A34B0277"
IDynamicTexture_UUID := &IID{0xA1DE1D3F, 0x6405, 0x447F, {0x8E, 0x95, 0x13, 0x83, 0xA3, 0x4B, 0x02, 0x77}}
IDynamicTexture :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idcompositiondynamictexture_vtable: ^IDynamicTexture_VTable,
}
IDynamicTexture_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetTexture:  proc "system" (this: ^IDynamicTexture, pTexture: ^ITexture, pRects: [^]D2D_RECT_L, rectCount: SIZE_T) -> HRESULT,
	SetTexture2: proc "system" (this: ^IDynamicTexture, pTexture: ^ITexture) -> HRESULT,
}

IDevice5_UUID_STRING :: "2C6BEBFE-A603-472F-AF34-D2443356E61B"
IDevice5_UUID := &IID{0x2C6BEBFE, 0xA603, 0x472F, {0xAF, 0x34, 0xD2, 0x44, 0x33, 0x56, 0xE6, 0x1B}}
IDevice5 :: struct #raw_union {
	#subtype idcompositiondevice4: IDevice4,
	using idcompositiondevice5_vtable: ^IDevice5_VTable,
}
IDevice5_VTable :: struct {
	using idcompositiondevice4_vtable: IDevice4_VTable,
	CreateDynamicTexture: proc "system" (this: ^IDevice5, compositionDynamicTexture: ^^IDynamicTexture) -> HRESULT,
}
