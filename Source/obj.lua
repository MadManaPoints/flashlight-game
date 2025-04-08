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
    self.held = false;
end

function Obj:update()
    -- used to track whether the sprite should be made bigger
    if(self.held) then
        if(not player.hovering) then
            self.held = false;
        end
    end

    if(self.held) then
        self:setScale(1.5);
    else
        self:setScale(1);
    end
end