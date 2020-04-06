
push = require 'push' -- importa a biblioteca push para criar uma resolução virtual


WINDOW_WIDTH = 432
WINDOW_HEIGHT = 243

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

pads = {
    p1X = 10,
    p1Y = 50,
    p2X = WINDOW_WIDTH - 20,
    p2Y = 30,
    width = 10,
    height = 40,
    speed = 100
}

-- INICIA O GAME
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


-- MAPEIA OS EVENTOS DE TECLADO
function love.keypressed(key , scancode, isrepeat)
    
    -- esc quita o jogo
    if key == "esc" then 
        love.event.quit()
    end
    
end


-- UPDATE
function love.update(dt)

    -- controls
    -- pad esquerdo
    if love.keyboard.isDown("w") then
        pads.p1Y = pads.p1Y - pads.speed * dt
    elseif love.keyboard.isDown("s") then
        pads.p1Y = pads.p1Y + pads.speed * dt
    end
    -- pad direito
    if love.keyboard.isDown("up") then
        pads.p2Y = pads.p2Y - pads.speed * dt
    elseif love.keyboard.isDown("down") then
        pads.p2Y = pads.p2Y + pads.speed * dt   
    end

    -- mantem os pads dentro da tela
    -- pad esquerdo
    if pads.p1Y < 0 then
        pads.p1Y = 0
    elseif pads.p1Y + 40 > WINDOW_HEIGHT then
        pads.p1Y = WINDOW_HEIGHT - 40
    end
    -- pad direito
    if pads.p2Y < 0 then
        pads.p2Y = 0
    elseif pads.p2Y + 40 > WINDOW_HEIGHT then
        pads.p2Y = WINDOW_HEIGHT - 40
    end

end


-- DESENHA A TELA
function love.draw()

    -- inicia a resolução virtual
    push:apply('start')

    -- limpa a tela
    love.graphics.clear(0, 0, 0, 255)
    -- desenha textos
    love.graphics.print("teste", 10 , 30)
    -- desenha a linha de divisão no centro
    love.graphics.line(WINDOW_WIDTH/2, 0, WINDOW_WIDTH/2, WINDOW_HEIGHT)
    -- desenha o background da esquerda
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle("fill", 0, 0, WINDOW_WIDTH/2, WINDOW_HEIGHT)
    -- desenha o pad direito
    love.graphics.rectangle("fill", pads.p2X, pads.p2Y, pads.width, pads.height)
    -- desenha o pad esquerdo
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.rectangle("fill", pads.p1X, pads.p1Y, pads.width, pads.height)

    -- finaliza a resolução virtual
    push:apply('end')

end
