
function love.load()
	Lava = {
	display = {
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight()}}
	Lava.lava = {x = 0, y = Lava.display.height * 0.80, speed = 50}
end

function love.update(dt)
	
	Lava.lava.y = Lava.lava.y - Lava.lava.speed * dt
	
end

function love.draw()
	love.graphics.rectangle("fill", Lava.lava.x, Lava.lava.y, Lava.display.width, Lava.display.height)
end