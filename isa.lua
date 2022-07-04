--
-- Copyright (C) 2015 Masatoshi Teruya
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
-- isa.lua
-- lua-isa
-- Created by Masatoshi Teruya on 15/09/14.
--
-- constants
local INF_POS = math.huge
local INF_NEG = -INF_POS
local type = type
local rawequal = rawequal
local floor = math.floor
local lower = string.lower
local getmetatable = debug.getmetatable

-- type
local function is_nil(arg)
    return type(arg) == 'nil'
end

local function is_boolean(arg)
    return type(arg) == 'boolean'
end

local function is_string(arg)
    return type(arg) == 'string'
end

local function is_number(arg)
    return type(arg) == 'number'
end

local function is_function(arg)
    return type(arg) == 'function'
end

local function is_table(arg)
    return type(arg) == 'table'
end

local function is_thread(arg)
    return type(arg) == 'thread'
end

local function is_userdata(arg)
    return type(arg) == 'userdata'
end

--- is_callable
local function is_callable(v)
    if type(v) == 'function' then
        return true
    end

    local mt = getmetatable(v)
    if type(mt) == 'table' then
        return type(mt.__call) == 'function'
    end

    return false
end

-- boolean
local function is_true(arg)
    return arg == true
end

local function is_false(arg)
    return arg == false
end

-- None
local function is_none(arg)
    return arg == nil or arg == false or arg == 0 or arg == '' or arg ~= arg
end

-- arithmetic
local function is_nan(arg)
    return arg ~= arg
end

-- integer
local function is_finite(arg)
    return type(arg) == 'number' and (arg < INF_POS and arg > INF_NEG)
end

local function is_int(arg)
    return is_finite(arg) and rawequal(floor(arg), arg)
end

local function is_int8(arg)
    return is_int(arg) and arg >= -128 and arg <= 127
end

local function is_int16(arg)
    return is_int(arg) and arg >= -32768 and arg <= 32767
end

local function is_int32(arg)
    return is_int(arg) and arg >= -2147483648 and arg <= 2147483647
end

-- unsigned integer
local function is_unsigned(arg)
    return type(arg) == 'number' and (arg < INF_POS and arg >= 0)
end

local function is_uint(arg)
    return is_unsigned(arg) and rawequal(floor(arg), arg)
end

local function is_uint8(arg)
    return is_uint(arg) and arg <= 255
end

local function is_uint16(arg)
    return is_uint(arg) and arg <= 65535
end

local function is_uint32(arg)
    return is_uint(arg) and arg <= 4294967295
end

local EXPORTS = {}

for k, v in pairs({
    -- type
    ['Nil'] = is_nil,
    ['Boolean'] = is_boolean,
    ['String'] = is_string,
    ['Number'] = is_number,
    ['Function'] = is_function,
    ['Func'] = is_function,
    ['Table'] = is_table,
    ['Thread'] = is_thread,
    ['Userdata'] = is_userdata,
    ['File'] = require('isa.isfile'),

    -- callable
    ['Callable'] = is_callable,

    -- boolean
    ['True'] = is_true,
    ['False'] = is_false,

    -- None: nil | false | 0 | '' | nan
    ['None'] = is_none,

    -- arithmetic
    -- NaN
    ['NaN'] = is_nan,
    ['Finite'] = is_finite,

    -- integer
    ['Int'] = is_int,
    ['Int8'] = is_int8,
    ['Int16'] = is_int16,
    ['Int32'] = is_int32,

    -- unsigned integer
    ['Unsigned'] = is_unsigned,
    ['UInt'] = is_uint,
    ['UInt8'] = is_uint8,
    ['UInt16'] = is_uint16,
    ['UInt32'] = is_uint32,
}) do
    EXPORTS[k], EXPORTS[lower(k)] = v, v
end

return EXPORTS
