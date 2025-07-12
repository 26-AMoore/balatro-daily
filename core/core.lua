local nativefs = require("nativefs")
local lovely = require("lovely")

assert(load(nativefs.read(lovely.mod_dir .. "/daily/UI/" .. "ui_definitions.lua")))()
assert(load(nativefs.read(lovely.mod_dir .. "/daily/UI/" .. "ui_functions.lua")))()

assert(load(nativefs.read(lovely.mod_dir .. "/daily/" .. "setup.lua")))()
