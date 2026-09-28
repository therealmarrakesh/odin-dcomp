# odin-dcomp

[DirectComposition](https://learn.microsoft.com/en-us/windows/win32/api/_directcomp/) bindings for [Odin](https://odin-lang.org).

## Install

Copy `dcomp.odin` into your Odin installation at:

```
vendor/directx/dcomp/dcomp.odin
```

It sits next to the existing `vendor/directx/dxgi` package, which it imports as `../dxgi`.

## Usage

```odin
package main

import "core:fmt"
import win32 "core:sys/windows"
import "vendor:directx/dcomp"

main :: proc() {
	device: ^dcomp.IDesktopDevice
	hr := dcomp.CreateDevice2(nil, dcomp.IDesktopDevice_UUID, (^rawptr)(&device))
	if win32.FAILED(hr) {
		fmt.eprintfln("CreateDevice2 failed: 0x%08X", u32(hr))
		return
	}
	defer device->Release()

	hr = device->Commit()
	if win32.FAILED(hr) {
		fmt.eprintfln("Commit failed: 0x%08X", u32(hr))
		return
	}
}
```

## Notes

- Overloaded COM methods follow the naming used by Microsoft's official Rust projection ([windows-rs](https://github.com/microsoft/windows-rs)). The second overload gets a `2` suffix, for example `SetOffsetX` and `SetOffsetX2`.
- Verified against Windows SDK 10.0.28000.0 (vtable layouts, IIDs, structs, enums and exported functions), and every method has been tested at runtime.
