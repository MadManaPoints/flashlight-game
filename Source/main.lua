import "CoreLibs/graphics";
import "CoreLibs/sprites";
import "CoreLibs/timer";
import "CoreLibs/object";
import "CoreLibs/crank";

import "bg";
import "circle";
import "obj";
import "sceneManager";

local pd <const> = playdate;
local gfx <const> = pd.graphics;
local vec <const> = gfx.geometry;

local boolean playerAdded = false;

--Scene Variable to Change Game State 
scene = {"game","start","end"}

TAGS = {
    player = 1,
    obstacle = 2,
	bg = 3
}

local itemArray = {}
	itemArray[0] = "images/enemyShip.png";
	itemArray[1] = "images/playerShip.png";

function setup()
	scene = "game";

	local background = Bg();
	background:add();

	local item = Obj(100, 100, itemArray[0]);
	item:add();
	local item2 = Obj(300, 200, itemArray[1]);
	item2:add();
end

setup();

function pd.update()
	gfx.sprite.update();
	--pd.timer.updateTimers();

	if scene == "game" then 
		if(not playerAdded) then
			local player = Circle(100, 100, 75);
			player:add();
			playerAdded = true;
		end
	end
end



