--Scene Manager 
local pd <const>  = playdate 
local gfx <const>  = pd.graphics

playerAdded = false;

SceneManager= {};

 class("SceneManager").extends()

function SceneManager:loadNewScene()
    gfx.sprite.removeAll()
    self.newScene = nil
end 

function SceneManager:switchScene(scene,...)
    

    ------------------------
        --GAME SCREEN--
    ------------------------
    if scene == ("game") and not playerAdded then

        self.newScene = scene
        self:loadNewScene()
       --ADD BACKGROUND 
        local background = Bg();
        background:add();
        --ADD PLAYER
        player = Circle(100, 100, 75);
        player:add();
    -- ADD OBJECTS
        local itemArray = {}
        itemArray[0] = "images/enemyShip.png";
        itemArray[1] = "images/playerShip.png";
            
        local item = Obj(100, 100, itemArray[0]);
        local item2 = Obj(300, 200, itemArray[1]);
        item:add();
        item2:add();
        playerAdded = true;
    end
end 

    ------------------------
        --GAME OVER--
    ------------------------
-- if scene == ("end") then 
    --playerAdded=false;
    --ADD END SCREEN 
    --ADD PLAYER MOVEMENT FOR END SCREEN 


