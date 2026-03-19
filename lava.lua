
function love.load()
	Lava = {
	display = {
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight()}}
	Lava.lava = {x = 0, y = Lava.display.height * 0.80, speed = 50}
	
	--obj refere-se ao player.
	obj = {}
	obj.x = Lava.display.width / 2
	obj.y = 100
	obj.size = {}
	obj.size.x = 50
	obj.size.y = 50
	
	function kill()
		if Lava.lava.y <= obj.y + obj.size.y then
			Lava.lava.speed = 0
		end
	end
	
end

function love.update(dt)
	
	Lava.lava.y = Lava.lava.y - Lava.lava.speed * dt
	
	kill()
	
end

function love.draw()
	love.graphics.rectangle("fill", Lava.lava.x, Lava.lava.y, Lava.display.width, Lava.display.height)
	love.graphics.rectangle("fill", obj.x - obj.size.x / 2, obj.y, obj.size.x, obj.size.y)
end