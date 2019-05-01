%2018. 06. 8
%Maia Mandel
%Ms. Krasteva
%This program runs a handy, everyday calendar!

%Screen Set Up
import GUI

%Delcaration Section
forward procedure mainMenu
forward procedure instructions
forward procedure userInput
forward procedure display
forward procedure goodbye
forward procedure error
forward procedure leap

var mainWindow : int := Window.Open ("position:350;200,graphics:640;400") %main window
var font : int := Font.New ("Mongolian Baiti:16") %main font
var menuButton : int := GUI.CreateButton (270, 50, 90, "Main Menu", mainMenu) %fonts
var instructionsButton : int := GUI.CreateButton (244, 200, 150, "Instructions", instructions) %buttons
var calendarButton : int := GUI.CreateButton (244, 250, 150, "Customize a calendar", userInput)
var exitButton : int := GUI.CreateButton (244, 150, 150, "Exit", GUI.Quit)
var createButton : int := GUI.CreateButton (260, 100, 90, "Create Calendar", display)
var mousex, mousey, button : int := 0 %user inputs
var day, month, year, leapYear : string %main calendar variables

%Hide Buttons
procedure hideButtons
    GUI.Hide (menuButton)
    GUI.Hide (calendarButton)
    GUI.Hide (createButton)
    GUI.Hide (instructionsButton)
    GUI.Hide (exitButton)
end hideButtons

%Music
process music
    Music.PlayFile ("Ta-Da.mp3") %Music
end music

%Program Title
procedure title
    hideButtons
    var font2 : int := Font.New ("Mongolian Baiti:14") %new font
    colourback (102) %nice blue background
    cls
    Draw.Text ("CUSTOM CALENDAR", 227, 380, font2, 16) %name of program
end title

%Program Introduction
procedure introduction
    title
    Draw.Text ("Welcome to Custom Calendar!", 190, 300, font, 16) %description
    Draw.Text ("This program will allow you to see into your future,", 20, 250, font, 16)
    Draw.Text ("delve into your past,", 340, 220, font, 16)
    Draw.Text ("or plan your present!", 450, 190, font, 16)
    for x : 1 .. 100
	drawfilloval (140, 130, x, x, white) %background clock
    end for
    drawoval (140, 130, 100, 100, black) %outline of clock
    drawline (240, 130, 210, 130, black) %3 o'clock
    drawline (40, 130, 70, 130, black) %9 o'clock
    drawline (140, 230, 140, 200, black) %12 o'clock
    drawline (140, 30, 140, 60, black) %6 o'clock
    for x : 1 .. 10
	drawline (140, 130, 156 + x, 173 - x, white) %erase
	drawline (140, 130, 157 + x, 172 - x, 12)  %seconds hand
	drawfilloval (140, 130, 5, 5, black) %middle
	Draw.ThickLine (140, 130, 100, 170, 3, black) %mintues hand
	Draw.ThickLine (140, 130, 120, 90, 3, black) %hours hand
	delay (250)
    end for
    GUI.Show (menuButton) %button
end introduction

%Main Menu
body mainMenu
setscreen ("position:350;200,graphics:640;400")
title
for x : 100 .. 150 by 15
    drawoval (320, 210, x, x, 53)     %pink circles
end for
GUI.Show (calendarButton) %show buttons
GUI.Show (instructionsButton)
GUI.Show (exitButton)
end mainMenu

%instructions
body instructions
title
for x : 300 .. 400 by 15
    drawoval (320, 200, x, x, 47) %pink circles
end for
GUI.Show (menuButton)
Draw.Text ("1. Click on 'Customize a calendar' to open your calendar.", 50, 300, font, black) %description of how to use my program
Draw.Text ("2. Insert a day, month and year.", 50, 250, font, black)
Draw.Text ("3. Watch Custom Calendar create the calendar of your dreams!", 50, 200, font, black)
Draw.Text ("4. If you would then like to create a new calendar", 50, 150, font, black)
Draw.Text ("or exit the program, click the 'Main Menu' button to return to", 50, 125, font, black)
Draw.Text ("the options screen.", 50, 100, font, black)
end instructions

%Pause Program
procedure pauseProgram
    var reply : string (1) %one character
    put ""
    put "Press any key to return...." ..
    getch (reply) %gets the character
end pauseProgram

%User Input
body userInput
title
for x : 295 .. 400 by 15
    drawoval (320, 200, x, x, 38) %pink circles
end for
Draw.Text ("Enter a year:", 60, 300, font, black) %ask for year
locate (8, 9)
get year : *
if length (year) not= 4 then %error trapping
    error
    userInput
else
    Draw.Text ("Enter a month:", 60, 250, font, black) %ask for month
    locate (11, 9)
    get month : *
    if month = "January" or month = "March" or month = "April" or month = "May" or month = "June" or month = "July" or month = "August" or month = "September" or month =
	    "October" or month = "November" or month = "December" then
	Draw.Text ("Enter the day of the week that the month starts on:", 60, 200, font, black)
	locate (14, 9)
	get day : *
    elsif month = "February" then %if February is a leap year
	leap
	Draw.Text ("Enter the day of the week that the month starts on:", 60, 200, font, black)
	locate (14, 9)
	get day : *
    else %error trapping
	error
	userInput
    end if
    if day = "Monday" or day = "Tuesday" or day = "Wednesday" or day = "Thursday" or day = "Friday" or day = "Saturday" or day = "Sunday" then
	GUI.Show (createButton)
    else %error trapping
	error
	userInput
    end if
end if
end userInput

%Error
body error
var errorWindow := Window.Open ("position:525;650,graphics:280;150")
colourback (68)
cls
put "Error! That is not a proper date." %description of why something went wrong
put "Please note that the year you input"
put "must be four digits. The month and"
put "day of the week must be spelled"
put "properly and have a capital at the"
put "beginning."
put ""
pauseProgram
Window.Close (errorWindow)
end error

%Leap year procedure
body leap
Window.Hide (mainWindow)
var leapWindow := Window.Open ("position:800;300,graphics:280;150") %new window
leapYear := " "
colourback (58)
cls
locate (2, 9)
put "Is it a leap year?"
for x : 1 .. 70 %boxes around words
    drawline (30 + x, 20, 30 + x, 100, 14)
    drawfillbox (180 + x, 20, 180 + x, 100, 14)
end for
Draw.Text ("Yes!", 45, 60, font, 58)
Draw.Text ("No!", 200, 60, font, 58)
loop
    mousewhere (mousex, mousey, button) %gets the leap year answer
    mousewhere (mousex, mousey, button)
    if button = 1 then
	if (mousex >= 30 and mousex <= 100) and (mousey >= 20 and mousey <= 100) then
	    leapYear := "Yes"
	elsif (mousex >= 180 and mousex <= 250) and (mousey >= 20 and mousey <= 100) then
	    leapYear := "No"
	end if
    end if
    exit when leapYear = "Yes" or leapYear = "No" %exits when you click a square
end loop
Window.Show (mainWindow)
Window.Close (leapWindow)
end leap

%display the calendar
body display
var monthLength : int     %length of month
var dayNumber : string     %how many days should be displayed
var awayDays : int     %number of days away from sunday
var monthFont : int := Font.New ("Vladimir Script:150")     %fonts
var yearFont : int := Font.New ("Vladimir Script:100")
var dayFont : int := Font.New ("Mongolian Baiti:24")

setscreen ("position:0;10,graphics:1260;900")

fork music %plays ta-da music when calendar appears

if month = "January" then     %background colours
    colourback (104)
    cls
elsif month = "February" then
    colourback (37)
    cls
elsif month = "March" then
    colourback (84)
    cls
elsif month = "April" then
    colourback (48)
    cls
elsif month = "May" then
    colourback (84)
    cls
elsif month = "June" then
    colourback (52)
    cls
elsif month = "July" then
    colourback (12)
    cls
elsif
	month = "August" then
    colourback (14)
    cls
elsif month = "September" then
    colourback (38)
    cls
elsif month = "October" then
    colourback (43)
    cls
elsif month = "November" then
    colourback (15)
    cls
elsif month = "December" then
    colourback (32)
    cls
end if

drawfillbox (49, 25, 1211, 875, 0)     %outline for calendar
drawbox (49, 25, 1211, 875, black)
Draw.ThickLine (51, 725, 1209, 725, 3, black)

for x : 0 .. 1109 by 166     %cubes
    drawbox (49 + x, 675, 215 + x, 625, black)
    drawbox (49 + x, 625, 215 + x, 525, black)
    drawbox (49 + x, 525, 215 + x, 425, black)
    drawbox (49 + x, 425, 215 + x, 325, black)
    drawbox (49 + x, 325, 215 + x, 225, black)
    drawbox (49 + x, 225, 215 + x, 125, black)
    drawbox (49 + x, 125, 215 + x, 25, black)
end for

drawline (547, 124, 547, 26, white)   %cover extra lines on bottom row
drawline (713, 124, 713, 26, white)
drawline (879, 124, 879, 26, white)
drawline (1045, 124, 1045, 26, white)

Draw.Text ("Sunday", 70, 640, font, black) %writes the days of the week
Draw.Text ("Monday", 236, 640, font, black)
Draw.Text ("Tuesday", 402, 640, font, black)
Draw.Text ("Wednesday", 568, 640, font, black)
Draw.Text ("Thursday", 734, 640, font, black)
Draw.Text ("Friday", 900, 640, font, black)
Draw.Text ("Saturday", 1066, 640, font, black)

if month = "January" then
    for x : 1 .. 800 by 40
	drawfillstar (400 + x, 30, 420 + x, 50, 14) %stars
	drawfillstar (400 + x, 60, 420 + x, 80, 14)
	drawfillstar (400 + x, 90, 420 + x, 110, 14)
    end for
    drawfillbox (670, 60, 900, 80, white) %white box
    Draw.Text ("Happy New Year!!", 700, 65, font, black)     %bottom row notes and pictures
elsif month = "February" then
    Draw.Text ("Custom Calendars wishes you a lovely Valentine's Day!", 393, 100, font, black)     %bottom row notes
    for x : 1 .. 60 %three hearts
	drawline (910, 35, 880 + x, 85, 62)
	drawfillarc (897, 85, 15, 15, 0, 180, 62)
	drawfillarc (925, 85, 15, 15, 0, 180, 62)
    end for
    for x : 1 .. 60
	drawline (1000, 35, 970 + x, 85, 62)
	drawfillarc (987, 85, 15, 15, 0, 180, 62)
	drawfillarc (1015, 85, 15, 15, 0, 180, 62)
    end for
    for x : 1 .. 60
	drawline (1085, 35, 1055 + x, 85, 62)
	drawfillarc (1072, 85, 15, 15, 0, 180, 62)
	drawfillarc (1100, 85, 15, 15, 0, 180, 62)
    end for
elsif month = "March" then
    drawfillbox (440, 80, 460, 30, brown) %tree barks
    drawfilloval (450, 90, 30, 30, 10) %tree stems
    drawfillbox (540, 80, 560, 30, brown)
    drawfilloval (550, 90, 30, 30, 10)
    drawfillbox (640, 80, 660, 30, brown)
    drawfilloval (650, 90, 30, 30, 10)
    drawfillbox (740, 80, 760, 30, brown)
    drawfilloval (750, 90, 30, 30, 10)
    drawfillbox (840, 80, 860, 30, brown)
    drawfilloval (850, 90, 30, 30, 10)
    drawfillbox (940, 80, 960, 30, brown)
    drawfilloval (950, 90, 30, 30, 10)
    drawfillbox (1040, 80, 1060, 30, brown)
    drawfilloval (1050, 90, 30, 30, 10)
    Draw.Text ("S", 440, 80, font, black) %bottom row notes
    Draw.Text ("P", 540, 80, font, black) %bottom row notes
    Draw.Text ("R", 640, 80, font, black) %bottom row notes
    Draw.Text ("I", 745, 80, font, black) %bottom row notes
    Draw.Text ("N", 840, 80, font, black) %bottom row notes
    Draw.Text ("G", 940, 80, font, black) %bottom row notes
    Draw.Text ("!", 1045, 80, font, black) %bottom row notes
elsif month = "April" then
    Draw.Text ("April showers...", 393, 100, font, black)    %bottom row notes
    drawfilloval (700, 100, 15, 15, 101) %left cloud
    drawfilloval (680, 100, 15, 15, 101)
    drawfilloval (660, 100, 15, 15, 101)
    drawfilloval (640, 80, 15, 15, 101)
    drawfilloval (660, 80, 15, 15, 101)
    drawfilloval (680, 80, 15, 15, 101)
    drawfilloval (700, 80, 15, 15, 101)
    drawfilloval (720, 80, 15, 15, 101)
    drawfilloval (640, 50, 2, 3, 101) %rain
    drawfilloval (650, 60, 2, 3, 101)
    drawfilloval (650, 35, 2, 3, 101)
    drawfilloval (670, 50, 2, 3, 101)
    drawfilloval (690, 40, 2, 3, 101)
    drawfilloval (700, 50, 2, 3, 101)
    drawfilloval (705, 60, 2, 3, 101)
    drawfilloval (720, 35, 2, 3, 101)
    drawfilloval (1000, 105, 15, 15, 101) %right cloud
    drawfilloval (980, 105, 15, 15, 101)
    drawfilloval (960, 105, 15, 15, 101)
    drawfilloval (940, 85, 15, 15, 101)
    drawfilloval (960, 85, 15, 15, 101)
    drawfilloval (980, 85, 15, 15, 101)
    drawfilloval (1000, 85, 15, 15, 101)
    drawfilloval (1020, 85, 15, 15, 101)
    drawfilloval (940, 50, 2, 3, 101)     %rain
    drawfilloval (950, 60, 2, 3, 101)
    drawfilloval (950, 35, 2, 3, 101)
    drawfilloval (970, 50, 2, 3, 101)
    drawfilloval (990, 40, 2, 3, 101)
    drawfilloval (1000, 50, 2, 3, 101)
    drawfilloval (1005, 60, 2, 3, 101)
    drawfilloval (1020, 35, 2, 3, 101)
elsif month = "May" then
    drawarc (445, 50, 10, 20, 270, 90, green) %stem
    drawfilloval (430, 80, 8, 8, 36) %petals
    drawfilloval (450, 80, 8, 8, 36)
    drawfilloval (440, 90, 8, 8, 36)
    drawfilloval (440, 70, 8, 8, 36)
    drawfilloval (440, 80, 6, 6, 9) %middle
    drawarc (545, 50, 10, 20, 270, 90, green) %stem
    drawfilloval (530, 80, 8, 8, 101) %petals
    drawfilloval (550, 80, 8, 8, 101)
    drawfilloval (540, 90, 8, 8, 101)
    drawfilloval (540, 70, 8, 8, 101)
    drawfilloval (540, 80, 6, 6, 38) %middle
    drawarc (645, 50, 10, 20, 270, 90, green) %stem
    drawfilloval (630, 80, 8, 8, 42) %petals
    drawfilloval (650, 80, 8, 8, 42)
    drawfilloval (640, 90, 8, 8, 42)
    drawfilloval (640, 70, 8, 8, 42)
    drawfilloval (640, 80, 6, 6, 14) %middle
    drawarc (745, 50, 10, 20, 270, 90, green) %stem
    drawfilloval (730, 80, 8, 8, 80) %petals
    drawfilloval (750, 80, 8, 8, 80)
    drawfilloval (740, 90, 8, 8, 80)
    drawfilloval (740, 70, 8, 8, 80)
    drawfilloval (740, 80, 6, 6, 53) %middle
    drawarc (845, 50, 10, 20, 270, 90, green) %stem
    drawfilloval (830, 80, 8, 8, 89) %petals
    drawfilloval (850, 80, 8, 8, 89)
    drawfilloval (840, 90, 8, 8, 89)
    drawfilloval (840, 70, 8, 8, 89)
    drawfilloval (840, 80, 6, 6, 63) %middle
    drawarc (945, 50, 10, 20, 270, 90, green)     %stem
    drawfilloval (930, 80, 8, 8, 6) %petals
    drawfilloval (950, 80, 8, 8, 6)
    drawfilloval (940, 90, 8, 8, 6)
    drawfilloval (940, 70, 8, 8, 6)
    drawfilloval (940, 80, 6, 6, 8) %middle
    drawarc (1045, 50, 10, 20, 270, 90, green) %stem
    drawfilloval (1030, 80, 8, 8, 3) %petals
    drawfilloval (1050, 80, 8, 8, 3)
    drawfilloval (1040, 90, 8, 8, 3)
    drawfilloval (1040, 70, 8, 8, 3)
    drawfilloval (1040, 80, 6, 6, 14) %middle
    for x : 1 .. 825 by 2
	drawline (383 + x, 25, 383 + x, 40, green) %grass
    end for
elsif month = "June" then
    Draw.Text ("SUMMER", 700, 90, font, black) %bottom row notes
    Draw.Text ("FUN!!!", 800, 50, font, black)
    drawfilloval (450, 75, 40, 40, 14) %sun
    drawline (491, 100, 525, 120, 14) %top ray
    drawline (494, 90, 550, 110, 14)
    drawline (497, 80, 550, 90, 14)
    drawline (500, 70, 550, 70, 14) %middle ray
    drawline (497, 60, 550, 50, 14)
    drawline (494, 50, 550, 30, 14)
    drawline (491, 40, 525, 26, 14) %bottom ray
    drawarc (590, 90, 10, 15, 0, 150, 16) %left bird
    drawarc (610, 90, 10, 15, 30, 180, 16)
    drawarc (615, 75, 10, 15, 0, 150, 16) %right bird
    drawarc (635, 75, 10, 15, 30, 180, 16)
    drawfilloval (1000, 75, 40, 40, 52)
    drawfilloval (1000, 75, 25, 40, 0)
    drawfilloval (1000, 75, 10, 40, 14)
    drawoval (1000, 75, 40, 40, black)
elsif month = "July" then
    drawfillbox (387, 30, 1205, 120, 12) %red sides
    drawfillbox (629, 30, 962, 120, white) %white middle
    drawfillmapleleaf (752, 35, 832, 115, 12) %middle maple leaf
    Draw.Text ("CANADA", 635, 100, font, black) %bottom row notes
    Draw.Text ("DAY!", 900, 40, font, black)     %bottom row notes
elsif month = "August" then
    drawfillbox (387, 30, 1205, 120, 76)
    for x : 1 .. 15
	drawline (890, 80, 875, 65 + x + x, 42) %fish tail
	drawoval (900, 80, x, x, 42) %fish body
	drawoval (899, 80, x, x, 42)
	drawdot (908, 85, 16) %fish eye
	drawarc (910, 87, 10, 15, 220 + x, 270 + x, 16) %fish smile :)
	drawoval (920, 90, x div 3.5, x div 3.5, 53) %big bubble
	drawoval (927, 97, x div 4, x div 4, 53) %medium bubble
	drawoval (933, 104, x div 6, x div 6, 53) %small bubble
    end for
    drawarc (500, 50, 20, 10, 190, 10, 53)     %right wave
    drawarc (540, 50, 20, 10, 170, 350, 53)
    drawarc (580, 50, 20, 10, 170, 350, 53)
    Draw.Text ("Summer's", 500, 90, font, black) %bottom row notes
    Draw.Text ("not", 680, 50, font, black) %bottom row notes
    Draw.Text ("over", 900, 40, font, black) %bottom row notes
    Draw.Text ("yet...", 1100, 90, font, black) %bottom row notes
elsif month = "September" then
    drawfillbox (547, 60, 1044, 120, 14) %school bus
    drawfilloval (1084, 70, 4, 4, 12) %headlights
    drawfilloval (1084, 90, 4, 4, 12)
    drawfillbox (1044, 60, 1084, 100, 14) %front part
    drawline (1054, 70, 1074, 70, black) %lines
    drawline (1054, 75, 1074, 75, black)
    drawline (1054, 80, 1074, 80, black)
    drawline (1054, 85, 1074, 85, black)
    drawline (1054, 90, 1074, 90, black)
    drawfilloval (600, 50, 20, 20, 15) %left wheel
    drawfilloval (991, 50, 20, 20, 15) %right wheel
    drawfillbox (580, 85, 600, 105, 101) %windows left of box
    drawfillbox (610, 85, 630, 105, 101)
    drawfillbox (640, 85, 660, 105, 101)
    drawfillbox (670, 85, 690, 105, 101)
    drawfillbox (700, 85, 720, 105, 101)
    drawfillbox (892, 85, 912, 105, 101) %windows right of box
    drawfillbox (922, 85, 942, 105, 101)
    drawfillbox (952, 85, 972, 105, 101)
    drawfillbox (982, 85, 1002, 105, 101)
    drawfillbox (1012, 85, 1032, 105, 101)
    Draw.Text ("SCHOOL    BUS", 732, 84, font, black) %bottom row notes
    drawbox (730, 75, 882, 105, black) %box around words
elsif month = "October" then
    drawfillarc (425, 95, 25, 25, 0, 180, 30) %head
    drawline (400, 40, 405, 30, 30) %bottom/legs
    drawline (405, 30, 410, 40, 30)
    drawline (410, 40, 415, 30, 30)
    drawline (415, 30, 420, 40, 30)
    drawline (420, 40, 425, 30, 30)
    drawline (425, 30, 430, 40, 30)
    drawline (430, 40, 435, 30, 30)
    drawline (435, 30, 440, 40, 30)
    drawline (440, 40, 445, 30, 30)
    drawline (445, 30, 450, 40, 30)
    drawfillbox (400, 95, 450, 40, 30) %body
    drawfill (401, 39, 30, 30) %fill of bottom/legs
    drawfill (411, 39, 30, 30)
    drawfill (421, 39, 30, 30)
    drawfill (431, 39, 30, 30)
    drawfill (441, 39, 30, 30)
    drawfilloval (416, 90, 5, 5, 53)
    drawfilloval (435, 90, 5, 5, 53)
    Draw.Text ("BOO!!!", 515, 65, font, black) %bottom row notes
    drawfillarc (1075, 95, 25, 25, 0, 180, 30) %head
    drawline (1050, 40, 1055, 30, 30) %bottom/legs
    drawline (1055, 30, 1060, 40, 30)
    drawline (1060, 40, 1065, 30, 30)
    drawline (1065, 30, 1070, 40, 30)
    drawline (1070, 40, 1075, 30, 30)
    drawline (1075, 30, 1080, 40, 30)
    drawline (1080, 40, 1085, 30, 30)
    drawline (1085, 30, 1090, 40, 30)
    drawline (1090, 40, 1095, 30, 30)
    drawline (1095, 30, 1100, 40, 30)
    drawfillbox (1050, 95, 1100, 40, 30) %body
    drawfill (1051, 39, 30, 30) %fill of bottom/legs
    drawfill (1061, 39, 30, 30)
    drawfill (1071, 39, 30, 30)
    drawfill (1081, 39, 30, 30)
    drawfill (1091, 39, 30, 30)
    drawfilloval (1066, 90, 5, 5, 53)
    drawfilloval (1085, 90, 5, 5, 53)
    Draw.Text ("BOO!!!", 915, 65, font, black) %bottom row notes
    drawfillarc (753, 100, 10, 20, 90, 200, 186) %stem of pumpkin
    drawfilloval (750, 70, 40, 40, 42) %pumpkin
    drawline (730, 80, 740, 80, 186) %left eye
    drawline (730, 80, 735, 90, 186)
    drawline (735, 90, 740, 80, 186)
    drawfill (735, 81, 186, 186)
    drawline (760, 80, 770, 80, 186) %right eye
    drawline (760, 80, 765, 90, 186)
    drawline (765, 90, 770, 80, 186)
    drawfill (765, 81, 186, 186)
    drawline (735, 50, 765, 50, 186)
    drawline (735, 50, 730, 55, 186)
    drawline (765, 50, 770, 55, 186)
elsif month = "November" then
    Draw.Text ("Lest we forget.", 393, 100, font, black) %bottom row notes
    drawfilloval (750, 75, 40, 40, 12)
    Draw.ThickLine (710, 115, 790, 35, 3, white)
    Draw.ThickLine (790, 115, 710, 35, 3, white)
    drawline (750, 60, 750, 90, black)
    drawline (735, 75, 765, 75, black)
    drawfilloval (750, 75, 10, 10, black)
elsif month = "December" then
    Draw.ThickLine (450, 50, 450, 100, 3, 101) %verticle
    Draw.ThickLine (445, 105, 450, 100, 3, 101) %end top
    Draw.ThickLine (450, 100, 455, 105, 3, 101) %end top
    Draw.ThickLine (445, 45, 450, 50, 3, 101) %end bottom
    Draw.ThickLine (450, 50, 455, 45, 3, 101) %end bottom
    Draw.ThickLine (420, 75, 480, 75, 3, 101) %horizontal
    Draw.ThickLine (480, 75, 485, 80, 3, 101) %end right
    Draw.ThickLine (480, 75, 485, 70, 3, 101) %end right
    Draw.ThickLine (420, 75, 415, 80, 3, 101) %end left
    Draw.ThickLine (420, 75, 415, 70, 3, 101) %end left
    Draw.ThickLine (420, 100, 480, 50, 3, 101) %diagonal
    Draw.ThickLine (480, 100, 420, 50, 3, 101) %diagonal
    drawfilloval (600, 106, 15, 10, 101) %head
    drawfilloval (600, 83, 18, 13, 101) %middle
    drawfilloval (600, 50, 30, 20, 101) %bottom
    drawoval (600, 106, 15, 10, black) %head
    drawoval (600, 83, 18, 13, black) %middle
    drawoval (600, 50, 30, 20, black) %botton
    drawfilloval (600, 88, 2, 2, black) %button
    drawfilloval (600, 75, 2, 2, black) %button
    drawfilloval (600, 60, 2, 2, black) %button
    drawfilloval (595, 110, 1, 1, black) %left eye
    drawfilloval (605, 110, 1, 1, black) %right eye
    drawarc (600, 106, 5, 5, 180, 0, red) %mouth
    drawline (582, 83, 572, 93, black) %left arm
    drawline (618, 83, 628, 93, black) %right arm
    Draw.ThickLine (750, 50, 750, 100, 3, 101) %verticle
    Draw.ThickLine (745, 105, 750, 100, 3, 101) %end top
    Draw.ThickLine (750, 100, 755, 105, 3, 101) %end top
    Draw.ThickLine (745, 45, 750, 50, 3, 101) %end bottom
    Draw.ThickLine (750, 50, 755, 45, 3, 101) %end bottom
    Draw.ThickLine (720, 75, 780, 75, 3, 101) %horizontal
    Draw.ThickLine (780, 75, 785, 80, 3, 101) %end right
    Draw.ThickLine (780, 75, 785, 70, 3, 101) %end right
    Draw.ThickLine (720, 75, 715, 80, 3, 101) %end left
    Draw.ThickLine (720, 75, 715, 70, 3, 101) %end left
    Draw.ThickLine (720, 100, 780, 50, 3, 101) %diagonal
    Draw.ThickLine (780, 100, 720, 50, 3, 101) %diagonal
    drawfilloval (900, 106, 15, 10, 101) %head
    drawfilloval (900, 83, 18, 13, 101) %middle
    drawfilloval (900, 50, 30, 20, 101) %bottom
    drawoval (900, 106, 15, 10, black) %head
    drawoval (900, 83, 18, 13, black) %middle
    drawoval (900, 50, 30, 20, black) %botton
    drawfilloval (900, 88, 2, 2, black) %button
    drawfilloval (900, 75, 2, 2, black) %button
    drawfilloval (900, 60, 2, 2, black) %button
    drawfilloval (895, 110, 1, 1, black) %left eye
    drawfilloval (905, 110, 1, 1, black) %right eye
    drawarc (900, 106, 5, 5, 180, 0, red) %mouth
    drawline (882, 83, 872, 93, black) %left arm
    drawline (918, 83, 928, 93, black) %right arm
    Draw.ThickLine (1050, 50, 1050, 100, 3, 101) %verticle
    Draw.ThickLine (1045, 105, 1050, 100, 3, 101) %end top
    Draw.ThickLine (1050, 100, 1055, 105, 3, 101) %end top
    Draw.ThickLine (1045, 45, 1050, 50, 3, 101) %end bottom
    Draw.ThickLine (1050, 50, 1055, 45, 3, 101) %end bottom
    Draw.ThickLine (1020, 75, 1080, 75, 3, 101) %horizontal
    Draw.ThickLine (1080, 75, 1085, 80, 3, 101) %end right
    Draw.ThickLine (1080, 75, 1085, 70, 3, 101) %end right
    Draw.ThickLine (1020, 75, 1015, 80, 3, 101) %end left
    Draw.ThickLine (1020, 75, 1015, 70, 3, 101) %end left
    Draw.ThickLine (1020, 100, 1080, 50, 3, 101) %diagonal
    Draw.ThickLine (1080, 100, 1020, 50, 3, 101) %diagonal
end if

Font.Draw (month, 60, 735, monthFont, black)     %repeat text
Font.Draw (year, 850, 745, yearFont, black)

if month = "January" or month = "March" or month = "May" or month = "July" or month = "August" or month = "October" or month = "December" then     %number of days for each month
    monthLength := 31
elsif month = "April" or month = "June" or month = "September" or month = "November" then
    monthLength := 30
elsif month = "February" and leapYear = "Yes" then
    monthLength := 29
elsif month = "February" then
    monthLength := 28
end if

if day = "Sunday" then  %how many days away from sunday
    awayDays := 0
elsif day = "Monday" then
    awayDays := 1
elsif day = "Tuesday" then
    awayDays := 2
elsif day = "Wednesday" then
    awayDays := 3
elsif day = "Thursday" then
    awayDays := 4
elsif day = "Friday" then
    awayDays := 5
elsif day = "Saturday" then
    awayDays := 6
end if

for x : 0 .. monthLength - 1 + awayDays %moves the start of the month to a different day of the week
    if day = "Sunday" then
	dayNumber := intstr (x + 1)
    elsif day = "Monday" then
	dayNumber := intstr (x + 0)
    elsif day = "Tuesday" then
	dayNumber := intstr (x - 1)
    elsif day = "Wednesday" then
	dayNumber := intstr (x - 2)
    elsif day = "Thursday" then
	dayNumber := intstr (x - 3)
    elsif day = "Friday" then
	dayNumber := intstr (x - 4)
    elsif day = "Saturday" then
	dayNumber := intstr (x - 5)
    end if
    if strint (dayNumber) > 0 then
	Draw.Text (dayNumber, 60 + (x mod 7) * 167, 535 - (x div 7) * 100, dayFont, black) %actually makes the calendar
    end if
end for

var menuButton2 : int := GUI.CreateButton (1110, 35, 90, "Main Menu", mainMenu)     %button
end display

body goodbye
title
for x : 250 .. 400 by 15
    drawoval (320, 200, x, x, 5)     %pink circles
end for
Draw.Text ("Thanks for using Custom Calendar!", 175, 110, font, 12)
Draw.Text ("This program was created by Maia Mandel.", 140, 70, font, 12)
Draw.Text ("TIME for this program to close.", 190, 150, font, 5)
for x : 1 .. 50
drawfilloval (325, 250, x, x, 0) %background clock
drawfilloval (325, 250, x div 25, x div 25, 16) %middle dot of the clock
end for
drawoval (325, 250, 50, 50, black) %outline clock
drawline (325, 300, 325, 285, black) %time places (3 o'clock)
drawline (375, 250, 360, 250, black)
drawline (325, 200, 325, 215, black)
drawline (275, 250, 290, 250, black)
Draw.ThickLine (325, 250, 301, 280, 2, black) %minutes hand
Draw.ThickLine (325, 250, 301, 240, 2, black) %hours hand
for y : 1 .. 3 %move three times
    for x : 1 .. 15 %moving forward seconds hand
	drawline (325, 250, 339 + x, 281 - x, 0)
	drawline (325, 250, 340 + x, 280 - x, red)
	drawfilloval (325, 475, 2, 2, black)
	delay (100)
    end for
    for x : 1 .. 15
	drawline (325, 250, 356 - x, 264 + x, 0) %moving back seconds hand
	drawline (325, 250, 355 - x, 265 + x, red)
	drawfilloval (325, 475, 2, 2, black)
	delay (100)
    end for
end for
Window.Close (mainWindow)
end goodbye

%Main Program
introduction
loop
    exit when GUI.ProcessEvent
end loop
goodbye
%End program
