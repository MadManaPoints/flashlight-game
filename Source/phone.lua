local pd <const> = playdate;
local gfx <const> = pd.graphics;

Phone={};

class('Phone').extends(gfx.sprite);

function Phone:init(image)
    local img = gfx.image.new(image);
    self:setImage(img);
	self:moveTo(150, 150);
    self:setZIndex(31);
    self:setScale(1.8);
end

function Phone:update()
    if(pd.isCrankDocked()) then
        self:moveTo(0, -200);
    else
        self:moveTo(player.x + 40, 200);
    end
end