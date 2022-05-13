local modules = {
    "core.init",
    "plugin.init",
}

local function setup()
    for _, module in ipairs(modules) do
        require(module).setup()
    end
end

setup()
