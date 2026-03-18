return {
    
    --cria e retorna um objeto player
    new = function(x, y)
        
        local self = {
    	    width = 50,
    	    height = 50,
    	    radius = 25,
        	velocityX = 0,
    	    velocityY = 0
        }
        
        --definir a posição
        self.x = x - (self.width / 2)
        self.y = y - (self.height / 2)
        
        return self
        
    end,
    
    
    --função de update do player
    update = function(self, dt)
        --adiciona gravidade
	    self.velocityY = self.velocityY + gravity * dt
	    
	    --move o player de acordo com a velocidade do mesmo
	    self.x = self.x + self.velocityX * dt
	    self.y = self.y + self.velocityY * dt
	
	    --colisão com plataformas
	    if self.y + self.height >= platform.y then
	    	self.y = platform.y - self.height
	        self.velocityY = 0
	    end
    end,
    
    
    --função de draw do player
    draw = function(self)
        
    	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.radius)
        
    end
}