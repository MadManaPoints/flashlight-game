local pd <const> = playdate;
local gfx <const> = pd.graphics;

Obj={};

class("Obj").extends(gfx.sprite);

function Obj:init(x, y, img)
    self:moveTo(x, y);
    local newSprite = gfx.image.new(img);
    self:setImage(newSprite);
    self:setZIndex(31);
    self:setCollideRect(0, 0, self:getSize());
    self:setTag(TAGS.obstacle);
end

