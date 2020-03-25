import conf.lua

pad_left = {
    width = 10,
    height = 30,
    x = 30,
    y = 40,
    speed = 50,
}

function love.load()

end

function love.update(dt)

end

function love.draw()
    love.graphics.print("hello vaca!")

    love.graphics.rectangle("fill", pad_left.x, pad_left.y, pad_left.width, pad_left.height)

end