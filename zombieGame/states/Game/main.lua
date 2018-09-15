function load()

end

function love.update(dt)

end

function love.draw()
    local draw = love.graphics.draw
    draw(newGame, 0 , 0)
end

function love.keypressed(key)
    if key == "escape" then
        loadState("mainMenu")
    end
end

function love.mousepressed(x,y,button)

end