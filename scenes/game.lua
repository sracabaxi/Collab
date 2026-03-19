return {
	init = function(scene)
		--cria um player
		scene:newActor("player", display.width / 2, 0)
		--scene:newActor("player", display.width / 2, 100)
		
		scene:newSolid("platform", display.width / 2, display.height * 0.80)
		--cria uma plataforma
		--platformBase.new(game, (display.width / 2), display.height * 0.80)

	end,
	
	--atualiza antes dos atores e solidos
	update = function(scene, dt)
		
	end,
	
	--atualiza depois dos atores e solidos
	lateUpdate = function(scene, dt)
		
	end,
	
	--desenha antes dos atores e solidos
	draw = function(scene)
		
	end,
	
	--desenha apos os atores e solidos
	lateDraw = function(scene)
		
	end
}