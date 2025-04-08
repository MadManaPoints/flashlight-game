--Scene Manager 
local pd <const>  = playdate 
local gfx <const>  = pd.graphics

local dict img = {}
    img["jar"] = "images/Jar.png";
    img["bottle1"] = "images/Bottle1.png";
    img["bottle2"] = "images/Bottle2.png";
    img["bottle3"] = "images/Bottle3.png";
    img["bottle4"] = "images/Bottle4.png";
    img["icon1"] = "images/Crank icon1.png";
    img["icon2"] = "images/Crank icon2.png";
    img["check phone1"] = "images/Checkphoneopaque.png";
    img["check phone2"] = "images/Checkphone.png";
    img["start"] = "images/StartGame.png";
    img["end"] = "images/EndGame.png";
    img["settings"] = "images/Settings.png";
    img["phone1"] = "images/InGamePhoneWallpaper.png";
    img["phone2"] = "images/InGamePhone.png";
    img["phone3"] = "images/In Game Phone light on.png";
    img["menu"] = "images/Menu.png";
    img["hookah"] = "images/Hookah.png";
    img["beer"] = "images/BeerCan.png";
    img["cup"] = "images/Cup.png";
    img["cup flip"] = "images/Cup upside down.png";
    img["shelf"] = "images/Gameshelf.png";

playerAdded = false;

SceneManager= {};

 class("SceneManager").extends()

function SceneManager:loadNewScene()
    gfx.sprite.removeAll()
    self.newScene = nil
end 

function SceneManager:switchScene(scene,...)
    self.newScene = scene
    ------------------------
        --GAME SCREEN--
    ------------------------
    if scene == ("game") and not playerAdded then
        self:loadNewScene()
       --ADD BACKGROUND 
        local background = Bg();
        background:add();
        local shelf = Shelf(200, 120, img["shelf"]);
        shelf:add();
        local phone = Phone(img["phone3"]);
        phone:add();
        --ADD PLAYER
        player = Circle(100, 100, 60);
        player:add();
        -- ADD OBJECTS    
        local item = Obj(150, 50, img["beer"]);
        local item2 = Obj(220, 130, img["cup"]);
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


