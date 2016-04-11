module Main where

import Hand.Model
import Hand.Update
import Hand.View
import StartApp.Simple exposing (start)

main = start
  { model = Hand.Model.fullDeck
  , update = Hand.Update.update
  , view = Hand.View.view
  }
