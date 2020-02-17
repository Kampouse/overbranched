local F = 0 
Alist = {}

A = {}
size = {}
vroom  = {}
simple = {}
A.john = {}
same  = {}
A.image1X = {0}
A.image2X = {0}
A.image3X= {0}
A.image4X = {0}
A.image5X= {0}
A.image6X= {0}
A.image8X = {0}


A.image1Y = {0}
A.image2Y = {0}
A.image3Y = {0}
A.image4Y = {0}
A.image5Y = {0}
local count  = 100





listy = {}
image = {}
listA = {A.image1Y,A.image2Y,A.image3Y,A.image4Y,A.image5Y}
list = {A.image1X,A.image2X,A.image3X,A.image4X,A.image5X}
--convert table to array --

function tabled(tablex,tabley)
               x,y =  love.mouse.getPosition()
                table.insert(tablex,x)
                table.insert(tabley,y)
                        end

function locateimage()
for i = 1,5 do
    for j, a in pairs(listA[i]) do
        listA[i][j] = a
                end
    for j, v in pairs(list[i]) do
        list[i][j] = v
        size[i] = j 
                end
                        end
 -- write down array ---
for i = 1,5 do
        for j =  1,size[i] do 
               -- print(list[i][j],listA[i][j]) 
                        end
                                end
end
 function love.load()
    love.physics.setMeter(32)
    world = love.physics.newWorld(0,12.0*64,true)
    


 for i = 1,5 do 
 image[i] = love.graphics.newImage("joueur/player"..i..".png")
        end
        object = {}

              

    object.ground = {}
    object.ground.body = love.physics.newBody(world,0,420)
    object.ground.shape = love.physics.newRectangleShape(800,100)
    object.ground.fixture = love.physics.newFixture(object.ground.body,object.ground.shape)

    
    object.image = {}
    object.image.body = love.physics.newBody(world,0,0,"kinematic")
    object.image.shape = love.physics.newRectangleShape(100,400)
    object.image.fixture = love.physics.newFixture(object.image.body,object.image.shape)


    object.image["location"] = function(sourisX,SourisY)
        
        object.image.body = love.physics.newBody(world,sourisX,SourisY,"kinematic")
        object.image.shape = love.physics.newRectangleShape(image[3]:getWidth() - 75,image[3]:getHeight())
        object.image.fixture = love.physics.newFixture(object.image.body,object.image.shape)
        F = F + 1
     
         
        Alist[F] = object.image.body
        
        print(F)
        
        end        
        object.image1  = {}
        object.image1.body = love.physics.newBody(world,100,100,"dynamic")
        object.image1.shape = love.physics.newCircleShape(image[3]:getWidth() - 75)
        object.image1.fixture = love.physics.newFixture(object.image1.body,object.image1.shape)
        
        object.mouse = {}
        
        object.mouse.body = love.physics.newBody(world,love.mouse:getX(),love.mouse:getY(),"dynamic")
        object.mouse.shape = love.physics.newCircleShape(25)
        object.mouse.fixture = love.physics.newFixture(object.mouse.body,object.mouse.shape)

       

        object.mouse["touching"] = function()
                Contact:getFixtures()
                        print("hit",hited,hit)
                        -- could be better -- 


        end

      






end
function love.update(dt)
object.mouse.body:setPosition(love.mouse:getPosition())
    world:update(dt)
    TOUCH = world:getContacts()
   
                function love.keypressed(key)
     
                 if key == 's' then
                         
                        object.image1.body:applyForce(0,-5000 * 45)
                    
                end

                 if key == 'a'  then
                    object.image1.body:setLinearVelocity(200,0)
                    object.image1.body:applyForce(100,-1)
                end

                if key == 'd' then
                          object.image1.body:setLinearVelocity(-200,-1)
                end



                 if key == 'b' then object.image1.body:setPosition(0,0) 
                                        object.image1.body:setLinearVelocity(0,0)
                end 
                 if key == "1"  then state = "1"
                        print("state enable:", state )
                end 


                if key == "2" then state  = "2"
                end
                function love.mousepressed(x,mouseY, button,istouch)
                        if button == 1 then
                        
                                if state == "1" and count > 0  then
                                        local  SourisX,SourisY = love.mouse:getPosition()
                                        object.image.location(SourisX - 10,SourisY)
                                        print(moseX,mouseY)
                                        tabled(A.image2X,A.image2Y)
                                        count = count - 1
                                        print(count, "left")
                                       
                                end
              
              
                                        
                                       
                                        end
                                if state == "2" then print("state enable:",state)
                                        for i = 1,F,1 do 
                                        if object.image1.body:isTouching(Alist[i]) then
                                                print("hi")
                                        end
                                       
                                        end
                                        -- iviv
                                
                                end    
                                               
                                        
                                        
                              
                                
                                
                                
                                
                        end            
                end
 
 
end
function love.draw()
        locateimage()
       
        for i = 1,5 do
                 for j =  1,size[i] do 
                        love.graphics.draw(image[i],list[i][j],listA[i][j])
                        love.graphics.draw(image[3],object.image1.body:getPosition())
                        
                        love.graphics.rectangle("fill",love.mouse:getX(),love.mouse:getY(),image[3]:getWidth(),image[3]:getHeight())
                        
                                end

                                        
end

end







