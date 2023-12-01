/// @description Insert description here
// You can write your code in this editor
gameTime++

gameTime10MS =	floor(gameTime * 1.666 mod 100)
gameTimeS =		floor(gameTime/60 mod 60)
gameTimeM =		floor(gameTime/(60*60) mod 60)
gameTimeH =		floor(gameTime/(60*60*60))