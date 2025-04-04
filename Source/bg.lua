local pd <const> = playdate;
local gfx <const> = pd.graphics;

Bg={};

class("Bg").extends(gfx.sprite);

function Bg:init()
    local bg = gfx.image.new(400, 240);
	gfx.pushContext(bg);
		gfx.fillRect(0, 0, 400, 240);
	gfx.popContext();
	self:setImage(bg);
	self:moveTo(200, 120);
	self:setCollideRect(0, 0, self:getSize());
	self:setTag(TAGS.bg);
end