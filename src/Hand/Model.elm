module Hand.Model (Model, initialModel) where

import Card.Model exposing (Model(..))
import General exposing (ID)

type alias Model =
  { cards : List (ID, Card.Model.Model)
  , nextID : ID
  }

initialModel : Model
initialModel = subsetDeck [1..13]

emptyHand : Model
emptyHand =
  { cards = []
  , nextID = 1
  }

subsetDeck : List Int -> Model
subsetDeck cardNumbers =
  { cards = List.map (\x -> (x, Card.Model.cardFromInteger x) ) cardNumbers
  , nextID = 53
  }

unknownHand : Model
unknownHand =
  { cards =
    [ (1, UnknownCard)
    , (2, UnknownCard)
    , (3, UnknownCard)
    , (4, UnknownCard)
    , (5, UnknownCard)
    , (6, UnknownCard)
    , (7, UnknownCard)
    , (8, UnknownCard)
    , (9, UnknownCard)
    , (10, UnknownCard)
    , (11, UnknownCard)
    , (12, UnknownCard)
    , (13, UnknownCard)
    ]
  , nextID = 14
  }
