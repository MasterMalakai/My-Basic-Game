--config--
love.window.setMode(1360, 768)

function loadState(name)
    clearLoveCallbacks()
    local path = "states/" .. name
    require(path .. "/main")
    load()
end

function load()
end

function love.load()
    loadState("mainMenu")
end

function clearLoveCallbacks()
    love.draw = nil
    love.joystickpressed = nil
    love.joystickreleased = nil
    love.keypressed = nil
    love.keyrealeased = nil
    --love.load = nil
    love.mousepressed = nil
    love.mousereleased = nil
    love.update = nil
end
