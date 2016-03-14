import Hand exposing (..)
import Card exposing
  ( Card
  , Face(..)
  , Suit(..)
  , Value(..) )
import StartApp.Simple exposing (start)

main = start
  { model = Hand.init 
    [ Card.init Up (Value 5) Spades
    , Card.init Up King Diamonds
    , Card.init Down (Value 2) Hearts
    , Card.init Up (Value 2) Hearts
    , Card.init Up (Value 3) Hearts
    , Card.init Up (Value 4) Hearts
    , Card.init Up (King) Spades
    , Card.init Up (Ace) Clubs
    , Card.init Up (Jack) Hearts
    , Card.init Up (Queen) Diamonds
    , Card.init Up (Value 10) Clubs
    ]
  , update = Hand.update
  , view = Hand.view
  }
