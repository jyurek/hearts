module Game.Model where

import Player.Model
import General exposing (ID)

type Model
  = Outside { playerName : Maybe String , gameName : Maybe String }
  | Inside { players : List (Maybe (ID, Player.Model.Model)) }

initialModel : Model
-- initialModel = Outside { playerName = Nothing, gameName = Nothing }
initialModel = Inside
  { players =
    [ Just (1, Player.Model.initialModel)
    , Just (2, Player.Model.initialModel)
    , Just (3, Player.Model.initialModel)
    , Nothing
    ]
  }
