return {
    
    --cria e retorna um objeto platform
    new = function(x,y)
        
        local self = {
        	width = display.width * 0.05,
        	height = display.height * 0.005
        }
        
	    self.x = x - (self.width / 2)
        self.y = y - (self.height / 2)
        
        return self
    end,
    
    
    --função de draw da platform
    draw = function(self)
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    end
}