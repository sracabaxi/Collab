return {
	
	--cria e retorna um objeto player
	new = function(scene, x, y)
		
		local actor = {
			scene = scene,
			width = 50,
			height = 50,
			radius = 25,
			velocityX = 0,
			velocityY = 0,
			gravity = 100
		}
		
		--definir a posição
		actor.x = x - (actor.width / 2)
		actor.y = y - (actor.height / 2)
		
		
		--função de update do player
		function actor:update(dt)
			
			--adiciona gravidade
			self.velocityY = self.velocityY + self.gravity * dt
			
			--move o player de acordo com a velocidade do mesmo
			self.x = self.x + self.velocityX * dt
			self.y = self.y + self.velocityY * dt
			
			--colisão com plataformas
			local bottomSide = self.y + self.height
			for i, solid in ipairs(self.scene.solids) do
				
				if self.x <= solid.x + solid.width and self.x + self.width >= solid.x and bottomSide >= solid.y and bottomSide <= solid.y + solid.height then
					self.y = solid.y - self.height
					self.velocityY = self.velocityY * -0.1
					break
				end
				
			end
			
		end
		
		
		--função de draw do player
		function actor:draw()
			love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.radius)
		end
		
		
		--adiciona o player para a lista de actors do scene
		table.insert(scene.actors, actor)
		
		
		return self
	end
}