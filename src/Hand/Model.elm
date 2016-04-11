module Hand.Model (Model, ID, OrderedCard, initialModel, fullDeck, smallHand) where

import Card.Model exposing (Model(..), Suit(..), Value(..), Face(..))

type alias OrderedCard = (ID, Card.Model.Model)
type alias Model = 
  { cards : List OrderedCard
  , nextID : ID
  }
type alias ID = Int

initialModel : Model
initialModel =
  { cards = []
  , nextID = 1
  }

smallHand : Model
smallHand =
  { cards = [ (1, Card.Model.cardFromInteger 52 )
            , (2, Card.Model.cardFromInteger 1 )
            ]
  , nextID = 3
  }

fullDeck : Model
fullDeck =
  { cards = List.map (\x -> (x, Card.Model.cardFromInteger x) ) [1..35]
  , nextID = 53
  }
