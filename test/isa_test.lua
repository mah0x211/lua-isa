require('luacov')
local assert = require('assert')
local testcase = require('testcase')
local isa = require('isa');

local INF = math.huge
local INF_NEG = -INF
local NAN = 0 / 0
local FUNC = function()
end
local THREAD = coroutine.create(FUNC)
local FILE

function testcase.before_all()
    FILE = assert(io.open('./isa_test.lua'))
end

function testcase.funcs_in_lowercase()
    for k, f in pairs(isa) do
        -- test that functions are exported
        assert.is_string(k)
        assert.is_function(f)
        if string.find(k, '^[A-Z]') then
            -- test that functions are exported in lower case
            assert.equal(isa[string.lower(k)], f)
        end
    end
end

function testcase.is_nil()
    -- test that returns true
    assert.is_true(isa.Nil())
    assert.is_true(isa.Nil(nil))

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Nil(v))
    end
end

function testcase.is_none()
    -- test that returns true
    for _, v in ipairs({false, 0, '', NAN}) do
        assert.is_true(isa.None(v))
    end
    assert.is_true(isa.None())
    assert.is_true(isa.None(nil))

    -- test that returns false
    for _, v in ipairs({
        true,
        'foo',
        {},
        -1,
        0.1,
        1,
        INF,
        INF_NEG,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.None(v))
    end
end

function testcase.is_boolean()
    -- test that returns true
    for _, v in ipairs({true, false}) do
        assert.is_true(isa.Boolean(v))
    end

    -- test that returns false
    for _, v in ipairs({
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Boolean(v))
    end
    assert.is_false(isa.Boolean(nil))
    assert.is_false(isa.Boolean())
end

function testcase.is_string()
    -- test that returns true
    for _, v in ipairs({'', 'foo'}) do
        assert.is_true(isa.String(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.String(v))
    end
    assert.is_false(isa.String(nil))
    assert.is_false(isa.String())
end

function testcase.is_number()
    -- test that returns true
    for _, v in ipairs({-1, 0, 0.1, 1, INF, INF_NEG, NAN}) do
        assert.is_true(isa.Number(v))
    end

    -- test that returns false
    for _, v in ipairs({true, false, 'foo', '', {}, FUNC, THREAD, FILE}) do
        assert.is_false(isa.Number(v))
    end
    assert.is_false(isa.Number(nil))
    assert.is_false(isa.Number())
end

function testcase.is_function()
    -- test that returns true
    assert.is_true(isa.func(FUNC))

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.func(v))
    end
    assert.is_false(isa.func(nil))
    assert.is_false(isa.func())
end

function testcase.is_table()
    -- test that returns true
    assert.is_true(isa.Table({}))

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Table(v))
    end
    assert.is_false(isa.Table(nil))
    assert.is_false(isa.Table())
end

function testcase.is_thread()
    -- test that returns true
    assert.is_true(isa.Thread(THREAD))

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        FILE,
    }) do
        assert.is_false(isa.Thread(v))
    end
    assert.is_false(isa.Thread(nil))
    assert.is_false(isa.Thread())
end

function testcase.is_userdata()
    -- test that returns true
    assert.is_true(isa.Userdata(FILE))

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
    }) do
        assert.is_false(isa.Userdata(v))
    end
    assert.is_false(isa.Userdata(nil))
    assert.is_false(isa.Userdata())
end

function testcase.is_file()
    -- test that returns true
    assert.is_true(isa.File(FILE))

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
    }) do
        assert.is_false(isa.File(v))
    end
    assert.is_false(isa.File(nil))
    assert.is_false(isa.File())
end

function testcase.is_true()
    -- test that returns true
    assert.is_true(isa.True(true))

    -- test that returns false
    for _, v in ipairs({
        false,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.True(v))
    end
    assert.is_false(isa.True(nil))
    assert.is_false(isa.True())
end

function testcase.is_false()
    -- test that returns true
    assert.is_true(isa.False(false))

    -- test that returns false
    for _, v in ipairs({
        true,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.False(v))
    end
    assert.is_false(isa.False(nil))
    assert.is_false(isa.False())
end

function testcase.is_nan()
    -- test that returns true
    assert.is_true(isa.NaN(NAN))

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0,
        0.1,
        1,
        INF,
        INF_NEG,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.NaN(v))
    end
    assert.is_false(isa.NaN(nil))
    assert.is_false(isa.NaN())
end

function testcase.is_finite()
    -- test that returns true
    for _, v in ipairs({-1, 0, 0.1, 1}) do
        assert.is_true(isa.Finite(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        INF,
        INF_NEG,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Finite(v))
    end
    assert.is_false(isa.Finite(nil))
    assert.is_false(isa.Finite())
end

function testcase.is_int()
    -- test that returns true
    for _, v in ipairs({-1, 0, 1}) do
        assert.is_true(isa.Int(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        0.1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Int(v))
    end
    assert.is_false(isa.Int(nil))
    assert.is_false(isa.Int())
end

function testcase.is_int8()
    -- test that returns true
    for _, v in ipairs({-128, 0, 127}) do
        assert.is_true(isa.Int8(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -129,
        0.1,
        128,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Int8(v))
    end
    assert.is_false(isa.Int8(nil))
    assert.is_false(isa.Int8())
end

function testcase.is_int16()
    -- test that returns true
    for _, v in ipairs({-32768, 0, 32767}) do
        assert.is_true(isa.Int16(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -32769,
        0.1,
        32768,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Int16(v))
    end
    assert.is_false(isa.Int16(nil))
    assert.is_false(isa.Int16())
end

function testcase.is_int32()
    -- test that returns true
    for _, v in ipairs({-2147483648, 0, 2147483647}) do
        assert.is_true(isa.Int32(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -2147483649,
        0.1,
        2147483648,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Int32(v))
    end
    assert.is_false(isa.Int32(nil))
    assert.is_false(isa.Int32())
end

function testcase.is_unsigned()
    -- test that returns true
    for _, v in ipairs({0, 0.1, 1}) do
        assert.is_true(isa.Unsigned(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        -0.1,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.Unsigned(v))
    end
    assert.is_false(isa.Unsigned(nil))
    assert.is_false(isa.Unsigned())
end

function testcase.is_uint8()
    -- test that returns true
    for _, v in ipairs({0, 255}) do
        assert.is_true(isa.UInt8(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0.1,
        256,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.UInt8(v))
    end
    assert.is_false(isa.UInt8(nil))
    assert.is_false(isa.UInt8())
end

function testcase.is_uint16()
    -- test that returns true
    for _, v in ipairs({0, 65535}) do
        assert.is_true(isa.UInt16(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0.1,
        65536,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.UInt16(v))
    end
    assert.is_false(isa.UInt16(nil))
    assert.is_false(isa.UInt16())
end

function testcase.is_uint32()
    -- test that returns true
    for _, v in ipairs({0, 4294967295}) do
        assert.is_true(isa.UInt32(v))
    end

    -- test that returns false
    for _, v in ipairs({
        true,
        false,
        'foo',
        '',
        {},
        -1,
        0.1,
        4294967296,
        INF,
        INF_NEG,
        NAN,
        FUNC,
        THREAD,
        FILE,
    }) do
        assert.is_false(isa.UInt32(v))
    end
    assert.is_false(isa.UInt32(nil))
    assert.is_false(isa.UInt32())
end
