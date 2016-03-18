import Hand exposing (..)
import Card exposing
  ( Card
  , Face(..)
  , Suit(..)
  , Value(..) )
import StartApp.Simple exposing (start)

main = start
  { model = Hand.init 
  , update = Hand.update
  , view = Hand.view
  }
