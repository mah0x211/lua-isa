lua-isa
=========

[![test](https://github.com/mah0x211/lua-isa/actions/workflows/test.yml/badge.svg)](https://github.com/mah0x211/lua-isa/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/mah0x211/lua-isa/branch/master/graph/badge.svg)](https://codecov.io/gh/mah0x211/lua-isa)



type check utility module.

---

## Installation

```sh
luarocks install isa
```


## Functions

the following functions can also be called by the following lower-case aliases;

- `isa.Nil`: `isa.nil`
- `isa.Boolean`: `isa.boolean`
- `isa.String`: `isa.string`
- `isa.Number`: `isa.number`
- `isa.Function`: `isa.function`
- `isa.Func`: `isa.func`
- `isa.Table`: `isa.table`
- `isa.Thread`: `isa.thread`
- `isa.Userdata`: `isa.userdata`
- `isa.File`: `isa.file`
- `isa.Callable`: `isa.callable`
- `isa.True`: `isa.true`
- `isa.False`: `isa.false`
- `isa.None`: `isa.none`
- `isa.NaN`: `isa.nan`
- `isa.Finite`: `isa.finite`
- `isa.Int`: `isa.int`
- `isa.Int8`: `isa.int8`
- `isa.Int16`: `isa.int16`
- `isa.Int32`: `isa.int32`
- `isa.Unsigned`: `isa.unsigned`
- `isa.UInt`: `isa.uint`
- `isa.UInt8`: `isa.uint8`
- `isa.UInt16`: `isa.uint16`
- `isa.UInt32`: `isa.uint32`


## ok = isa.Nil( val )

the function determines whether a value is `nil` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `nil`; otherwise, `false`.


## ok = isa.Boolean( val )

the function determines whether a value is `boolean` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `boolean`; otherwise, `false`.


## ok = isa.String( val )

the function determines whether a value is `string` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `string`; otherwise, `false`.


## ok = isa.Number( val )

the function determines whether a value is `number` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `number`; otherwise, `false`.


## ok = isa.Function( val )

the function determines whether a value is `function` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `function`; otherwise, `false`.


## ok = isa.Table( val )

the function determines whether a value is `table` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `table`; otherwise, `false`.


## ok = isa.Thread( val )

the function determines whether a value is `thread` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `thread`; otherwise, `false`.


## ok = isa.Userdata( val )

the function determines whether a value is `userdata` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `userdata`; otherwise, `false`.


## ok = isa.File( val )

the function determines whether a value is `file` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `file`; otherwise, `false`.


## ok = isa.Callable( val )

the function determines whether a value is `function` or has a `__call` metamethod.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `function` or has a `__call` metamethod; otherwise, `false`.


## ok = isa.True( val )

the function determines whether a value is `true` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `true`; otherwise, `false`.


## ok = isa.False( val )

the function determines whether a value is `false` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `false`; otherwise, false.


## ok = isa.None( val )

the function determines whether a value is `none` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `nil`, `false`, `0`, `''(empty-string)` or `nan`; otherwise, `false`.


## ok = isa.NaN( val )

the function determines whether a value is `nan` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `nan`; otherwise, `false`.


## ok = isa.Finite( val )

the function determines whether a value is `finite` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `finite`; otherwise, `false`.


## ok = isa.Int( val )

the function determines whether a value is `int` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `int`; otherwise, `false`.


## ok = isa.Int8( val )

the function determines whether a value is `int8` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `int8`; otherwise, `false`.


## ok = isa.Int16( val )

the function determines whether a value is `int16` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `int16`; otherwise, `false`.


## ok = isa.Int32( val )

the function determines whether a value is `int32` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `int32`; otherwise, `false`.


## ok = isa.Unsigned( val )

the function determines whether a value is `unsigned` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `unsigned`; otherwise, `false`.


## ok = isa.UInt( val )

the function determines whether a value is `uint` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `uint`; otherwise, `false`.


## ok = isa.UInt8( val )

the function determines whether a value is `uint8` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `uint8`; otherwise, `false`.


## ok = isa.UInt16( val )

the function determines whether a value is `uint16` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `uint16`; otherwise, `false`.


## ok = isa.UInt32( val )

the function determines whether a value is `uint32` or not.

**Parameters**

- `val:any`: value to be tested.

**Returns**

- `ok:boolean`: `true` if the given value is `uint32`; otherwise, `false`.



