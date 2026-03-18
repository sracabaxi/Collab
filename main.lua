
function love.load()

	display = {}
	display.width = love.graphics.getWidth()
	display.height = love.graphics.getHeight()

	player = {}
	player.w = 50
	player.h = 50
	player.r = 25
	player.posx = (display.width / 2) - (player.w / 2)
	player.posy = display.height * 0.25
	player.velocityX = 0
	player.velocityY = 0
	player.colisionY = player.h + player.posy


	plat = {}
	plat.w = display.width * 0.05
	plat.h = display.height * 0.005
	plat.posx = (display.width / 2) - (plat.w / 2)
	plat.posy = display.height * 0.80
	
	gravity = 10
	
	temp = 0
	
	function coliY()
		if player.colisionY >= plat.posy then
			player.posy = plat.posy - player.colisionY
		end
	end
	
end

function love.update(dt)
	
	temp = temp + dt
	
	player.posx = player.posx + player.velocityX * dt
	player.posy = player.posy - player.velocityY * dt
	
	player.velocityY = player.velocityY - gravity * dt
	
	coliY()
	
end

function love.draw()

	love.graphics.rectangle("fill", player.posx, player.posy - player.velocityY, player.w, player.h, player.r)
	love.graphics.rectangle("line", plat.posx, plat.posy, plat.w, plat.h)
	love.graphics.print(temp, 0, 0)

end