require("Sprites/sprites")

function load()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()


    buttons = {{imgOn = newOn, imgOff = newOff, x = screenWidth/2, y = screenHeight/4, w = newOn:getWidth(), h = loadOn:getHeight(), action = "newGame"},   
    {imgOn = exitOn, imgOff = exitOff, x = screenWidth/2, y = screenHeight - exitOn:getHeight(), w = loadOn:getWidth(), h = loadOn:getHeight(), action = "exit"}}
    
end

function love.update(dt)
end

function love.draw()
    local x = love.mouse.getX()
    local y = love.mouse.getY()

    for k, v in pairs(buttons) do 
        drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
    end
end

function love.keypressed(key, scancode, isrepeat)
  
end

function love.mousepressed(x, y, button)
    if button == 1 then
        for k, v in pairs(buttons) do
            local inside = insideBox(x, y, v.x - (v.w/2), v.y - (v.h/2), v.w, v.h)

            if inside then
                if v.action == "newGame" then
                    loadState("Game")
                elseif v.action == "exit" then
                    love.event.quit()
                end
            end
        end
    end
end

function drawButton(off, on, x, y, w, h, mouse_x, mouse_y)
    local inside = insideBox( mouse_x, mouse_y, x - (w/2), y - (h/2), w, h)

    love.graphics.setColor( 255, 255, 255)

    if inside then
        love.graphics.draw(on, x, y, 0, 1, 1, (w/2), (h/2))
    else
        love.graphics.draw(off, x, y, 0, 1, 1, (w/2), (h/2))
    end
end

function insideBox( px, py, x, y, wx, wy )
    if px > x and px < x + wx then
        if py > y and py < y + wy then
            return true
        end
    end
    return false
end