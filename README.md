# Random-level-generation
Started using [Heartbeast's tutorial on random level generation](https://www.youtube.com/watch?v=Hds06We0_g0).

I've tried to change it to a 47 Tiles type

**Keys / Buttons**
- Mouse Wheel zoom in/out
- +/- Raise or lower max move speed
- F2 toggles custom debug overlay
- F3 toggles Game Maker debug overlay
- F4 toggles automatic level generation until it finds an unallocated tile
- F5 restarts the game
- R generates a new level
- T toggles orphan walls
- Y toggles double walls
- ESC closes the game

**Notes**
- It seems that tile collision require that position values to always be **integer numbers**. To solve this we need to remove fraction part from position values before collision checking and add them back after.
- Because we need to use integer values for positions, movement can become jaggy at low values (eg: values lower than 3 or 4 pixels per frame)
- To solve this, I recommend using higher resolution sprites/tiles. To still have a pixelated feel, you can draw your sprites at desired resolution, but save sprites/tiles upscaled by an integer value. Downside of this is that graphics will require more memory.
