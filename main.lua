
push = require 'push'


WINDOW_WIDTH = 432
WINDOW_HEIGHT = 243

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

pads = {
    p1X = 20,
    p1Y = 50,
    p2X = WINDOW_WIDTH - 20,
    p2Y = 30,
    width = 10,
    height = 40,
    speed = 100
}

function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- more "retro-looking" font object we can use for any text
    smallFont = love.graphics.newFont('font.ttf', 16)

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    -- initialize window with virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
         fullscreen = false,
         resizable = false,
         vsync = true
    })

end

function love.keypressed(key , scancode, isrepeat)
    
    -- esc quita o jogo
    if key == "esc" then 
        love.event.quit()
    end
    
end

function love.update(dt)

    -- controls
    if love.keyboard.isDown("w") then
        pads.p1Y = pads.p1Y - pads.speed * dt
    end
    
    if love.keyboard.isDown("s") then
        pads.p1Y = pads.p1Y + pads.speed * dt
    end


end

function love.draw()

    -- inicia a resolução virtual
    push:apply('start')

    
    -- limpa a tela
    love.graphics.clear(0, 0, 0, 255)
    -- desenha textos
    love.graphics.print("teste", 10 , 30)
    -- desenha a linha de divisão no centro
    love.graphics.line(WINDOW_WIDTH/2, 0, WINDOW_WIDTH/2, WINDOW_HEIGHT)
    -- desenha o pad esquerdo
    love.graphics.rectangle("fill", pads.p1X, pads.p1Y, pads.width, pads.height)
    -- desenha o pad direito
    love.graphics.rectangle("fill", pads.p2X, pads.p2Y, pads.width, pads.height)

    -- finaliza a resolução virtual
    push:apply('end')

end
