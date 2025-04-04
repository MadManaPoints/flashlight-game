--HI MY LOVE <3333 

--THINGS THAT ARE NOW DONE:
-- I updated the game state machine to run the game loop in the main file. 
-- I also added a scene manager to help with switching between scenes

-- !!!!!!!!! NEW PROBLEM: the player movement seems to be stuck to move one pixel 
--	in each direction, not sure how this got messed up when adding the state machine 

import "CoreLibs/graphics";
import "CoreLibs/sprites";
import "CoreLibs/timer";
import "CoreLibs/object";
import "CoreLibs/crank";

import "bg";
import "circle";
import "obj";
import "sceneManager"; -- IMPORT SCENEMANAGER SCRIPT 

local pd <const> = playdate;
local gfx <const> = pd.graphics;
local vec <const> = gfx.geometry;

local boolean playerAdded = false;

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



