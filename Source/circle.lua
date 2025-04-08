local pd <const> = playdate;
local gfx <const> = pd.graphics;
fullRot = false;

local offsetNum = 200.0;

Circle={};

class('Circle').extends(gfx.sprite);

function Circle:init(x, y, r)
    --Circle.super.init(self);
	self:moveTo(x, y);
	local circleImg = gfx.image.new(r * 2, r * 2);
	gfx.pushContext(circleImg);
		gfx.setColor(gfx.kColorWhite);
		gfx.fillCircleAtPoint(r, r, r);
	gfx.popContext();
	self:setImage(circleImg);
	self:setCollideRect(10, 10, 100, 100);
	self:setZIndex(30);
    self.speed = 5.0;
	self.counter = 0.0;
	self.hovering = false;
	self:setTag(TAGS.player);
end

function Circle:update()
	--Circle.super.update(self);
	if(pd.isCrankDocked()) then
		self:setZIndex(-1);
	else
		self:setZIndex(30);
	end
	
	local goalX, goalY = self.x, self.y;

	if(pd.buttonIsPressed(pd.kButtonRight) and self.x < 1000) then
		goalX += self.speed;
	end
	if(pd.buttonIsPressed(pd.kButtonLeft) and self.x > -600) then
		goalX -= self.speed;
	end
	if(pd.getCrankChange() < 0 and self.y > 70) then
		goalY -= self.speed / 2;
	end
	if(pd.getCrankChange() > 0 and self.y < 170) then
		goalY += self.speed / 2;
	end
	offsetX = -self.x  + offsetNum;
	gfx.setDrawOffset(offsetX, offsetY);

	

	local X, Y, collisions, numberOfCollisions = self:moveWithCollisions(goalX, goalY);
	for i = 1, numberOfCollisions do
		local collision = collisions[i];

		local collidedSprite = collision.other;
		local collisionTag = collidedSprite:getTag();

		-- if only colliding with background, hovering is false;
		if collisionTag == TAGS.obstacle then
			self.hovering = true;
			if pd.buttonJustPressed(pd.kButtonA) then
				collidedSprite.held = true;
			end 
		elseif collisionTag == TAGS.bg then
			self.hovering = false;
		end
	end
end

-- will keep map for now, but we're not using this 
function Circle:map(value, minA, maxA, minB, maxB)
        local range = maxA - minA;
        local valuePercent = (value - minA) / range;

        local newRange = maxB - minB;

        return valuePercent * newRange + minB;
end

function Circle:collisionResponse(other)
	return 'overlap';
end
