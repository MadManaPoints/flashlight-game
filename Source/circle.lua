local pd <const> = playdate;
local gfx <const> = pd.graphics;
fullRot = false;

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
	local goalX, goalY = self.x, self.y;

	if(pd.buttonIsPressed(pd.kButtonRight) and self.x < 335) then
		goalX += self.speed;
	end
	if(pd.buttonIsPressed(pd.kButtonLeft) and self.x > 65) then
		goalX -= self.speed;
	end
	if(pd.buttonIsPressed(pd.kButtonUp) and self.y > 70) then
		goalY -= self.speed;
	end
	if(pd.buttonIsPressed(pd.kButtonDown) and self.y < 170) then
		goalY += self.speed;
	end

	local actualX, actualY, collisions, numberOfCollisions = self:moveWithCollisions(goalX, goalY);
	for i = 1, numberOfCollisions do
		local collision = collisions[i];

		local collidedSprite = collision.other;
		local collisionTag = collidedSprite:getTag();

		if collisionTag == TAGS.obstacle then
			self.hovering = true;
		elseif collisionTag == TAGS.bg then
			self.hovering = false;
		end
	end

	print(self.hovering);
end

function Circle:map(value, minA, maxA, minB, maxB)
        local range = maxA - minA;
        local valuePercent = (value - minA) / range;

        local newRange = maxB - minB;

        return valuePercent * newRange + minB;
end

function Circle:collisionResponse(other)
	return 'overlap';
end
