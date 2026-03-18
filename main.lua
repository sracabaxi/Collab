
function love.load()

	display = {}
	display.width = love.graphics.getWidth()
	display.height = love.graphics.getHeight()

	player = {}
	player.w = 50
	player.h = 50
	player.r = 25
	player.posx = (display.width / 2) - (player.w / 2)
	player.posy = display.height * 0.75

	plat = {}
	plat.w = display.width * 0.05
	plat.h = display.height * 0.005
	plat.posx = (display.width / 2) - plat.w
	plat.posy = display.height * 0.80
	
	gravity = 10
	
	temp = 0

end

function love.update(dt)
	
	temp = temp + dt
	speed = gravity / temp
	
end

function love.draw()

	love.graphics.rectangle("fill", player.posx, player.posy - speed, player.w, player.h, player.r)
	love.graphics.rectangle("line", plat.posx, plat.posy, plat.w, plat.h)

end