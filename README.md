# Stories of Storm and Sand
Turn based strategy game coded as a learning experience in gamemaker studio 2.

## Known Issues
- camera edge-guarding not complete
- attack init icon is not deleted when it overlaps with attacker sprite
- map cleanup and restart still has some leaks, quiting out of one map, restarting another and then closing the game throws an exception
- camera snapback after combat resolution

## Improvements
- Map start logic rework for code readability
- Rework unit inheritance so unit objects only have configuration code
## Focus
1st playable version
- 1 map (done)
- title screen (done)
- 2 units (done)
- game end screen
- game end logic

### Mechanics track
- Game end logic - flag capture and elimination
- Terrain effects - hospital and fortress
- Combat preview window
- AI turn
- First Balance Pass

### Graphics track
- Bolt Knight finished animations (move lrud, attack blast, death)
- Fire brawler finished animations (idle, move lrud, attack rush, attack javelin, death)
- Water Knight concept pass
- 2nd Sand Alliance unit 


## Planned
- 2 Factions
- 4 units per faction (2/8 partially implemented)
- Faction Mechanics
- Fire emblem style combat triangle (done)
- 3 maps (1/3)

## Additional Credits

### Music
Music from https://filmmusic.io
"Clash Defiant" by Kevin MacLeod (https://incompetech.com)
License: CC BY (http://creativecommons.org/licenses/by/4.0/)

Music from https://filmmusic.io
"Crossing the Chasm" by Kevin MacLeod (https://incompetech.com)
License: CC BY (http://creativecommons.org/licenses/by/4.0/)