--HELLO MY WONDERFUL GIRLFRIEND!!

-- THE SCENEMANAGER IS DOING ITS THING NOW. I HAD TO PUT THE
-- LOADNEWSCENE FUNCTION INTO THE GAME SCENE CONDITIONAL
-- AND I GOT THE PLAYER MOVING AGAIN
-- PUSHING THIS SO WE CAN BOTH KEEP WORKING WITH THE FIX 

-- I MISS YOU <333

import "CoreLibs/graphics";
import "CoreLibs/sprites";
import "CoreLibs/timer";
import "CoreLibs/object";
import "CoreLibs/crank";

import "bg";
import "circle";
import "obj";
import "sceneManager"; -- IMPORT SCENEMANAGER SCRIPT 
import "shelf";
import "phone";

local pd <const> = playdate;
local gfx <const> = pd.graphics;
local vec <const> = gfx.geometry;

offsetX = 0.0;
offsetY = 0.0;

--Scene Variable to Change Game State 
scene = {"game","start","end"} -- NAMING GAME STATES/ SETTING AS VARS 

TAGS = {
    player = 1,
    obstacle = 2,
	bg = 3
}
 
function setup()
	scene = "game";-- SETTING SCENE TO GAME SCREEN (TEMPORARY)
end

setup();

function pd.update()
	--pd.timer.updateTimers();
	SceneManager:switchScene(scene); -- SWITCHES SCENES AND CLEARS SPRITES
	gfx.sprite.update();
end



