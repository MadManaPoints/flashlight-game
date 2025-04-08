local pd <const> = playdate;
local gfx <const> = pd.graphics;

Shelf={};

class("Shelf").extends(gfx.sprite);

function Shelf:init(x, y, image)
    local img = gfx.image.new(image);
	self:setImage(img);
	self:moveTo(x, y);
    self:setZIndex(31);
	self:setCollideRect(0, 0, self:getSize());
	self:setTag(TAGS.bg);
end