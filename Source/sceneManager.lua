--Scene Manager 
local pd <const>  = playdate 
local gfx <const>  = pd.graphics
SceneManager= {};

 class("SceneManager").extends()

function SceneManager:loadNewScene()
    gfx.sprite.removeAll()
    self.newScene()
end 

function SceneManager:switchScene(scene,...)
    self.newScene = scene
    self:loadNewScene()
end
