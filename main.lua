A = {}
size = {}
vroom  = {}
simple = {}
A.john = {}
same  = {}
A.john.dog3 = {1,2,3,4,5,5}
A.john.dog2 = {1,2,3,4,5,5}
A.john.dog1 = {1,2,3,4,5,5}
A.john.dog = {1,2,3,4,5,5}
A.john.wife = {2,1,2,2,3,3}
A.john.dogY = {2,3,4,5,6,7}
A.john.wifY = {30,30,300,30,3,4}


A.john.dogY = {0}
A.john.dog1Y = {0}
A.john.dog2Y = {0}
A.john.dog3Y = {0}







listy = {}
image = {}
listA = {A.john.wifY,A.john.dogY,A.john.dog1Y,A.john.dog2Y,A.john.dog3Y}
list = {A.john.dog,A.john.dog1,A.john.dog2,A.john.dog3,A.john.wife}
--convert table to array --

function tabled(tablex,tabley)
               x,y =  love.mouse.getPosition()
                table.insert(tablex,x)
                table.insert(tabley,y)
                        end

function locateimage()
for i = 1,2 do
    for j, a in pairs(listA[i]) do
        listA[i][j] = a
                end
    for j, v in pairs(list[i]) do
        list[i][j] = v
        size[i] = j 
                end
                        end
 -- write down array ---
for i = 1,2 do
        for j =  1,size[i] do 
               -- print(list[i][j],listA[i][j]) 
                        end
                                end
end
 function love.load()
 for i = 1,5 do 
 image[i] = love.graphics.newImage("player"..i..".png")
        end 
end
function love.update(dt)
                function love.keypressed(key)
                 if key == "1"  then state = "1"
                        print("state enable:", state )
                end 
                end
                function love.mousepressed(x,mouseY, button,istouch)
                if button == 1 then
                        if state == "1" then
               tabled(A.john.dog,A.john.wifY)
              end
                 end
                     end
end
function love.draw()
        locateimage()
 
        for i = 1,2 do
                 for j =  1,size[i] do 
                        love.graphics.draw(image[i],list[i][j],listA[i][j])
                        
                        end
                        
                                end

                                        
end









