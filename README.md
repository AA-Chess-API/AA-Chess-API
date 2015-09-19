# AA-Chess REST API

`GET /games` 
lists all availible the games. `?all=true` list all games regardless of avalibility.

`POST /games?g=[GAME_NAME]&p=[PLAYER_NAME]` 
creates a new game and returns a URL (refered to as `player_url`) that the player can use to check the game status or deliver their next move. `GAME_NAME` must be a unique in through all the games.

`PATCH /join?g=[GAME_NAME]&p=[PLAYER_NAME]` 
lets a player join an availible game.

`GET player_url` 
returns a JSON object that looks like `{ status: "GO/WAIT", move: [[start_x,start_y],[end_x, end_y]] }`. "WAIT" signifies that it is not your turn to make a move. "GO" signifies that you can now deliver your move with a patch request. If the status if "GO", a `move` array will be availible that represents your opponent's last move. You should use this to update your game state accordingly. A status of "GO" and a move of nil means that this is the first turn of the game.

`PATCH player_url?move=[YOUR_MOVE]` 
sends your move to the server. A move should take the form of `[[start_x,start_y],[end_x, end_y]]`. This API (as of now) is ignorant of any rules of chess. It only delivers messages. You should therefore make sure your move is valid before sending it.
