
function hitboxes(PositionXnegative, PositionXpositive, PositionY)

--detecta se o player está em cima da plataforma
	if actor.y >= PositionY and actor.x >= PositionXnegative and actor.x  <= PositionXpositive then
		velocityY = 0
	end
end

hitboxes ()