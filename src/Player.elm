module Player where

import Hand exposing (..)
import Card exposing (..)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

-- MODEL

type Orientation = Vertical | Horizontal
type alias Player =
  { hand : Hand
  , score : Int
  , name : String
  , position : Int
  , orientation : Orientation
  , id : ID }

type alias ID = Int

init : Player
init =
  { hand = Hand.init
  , score = 0
  , name = "Player"
  , position = 1
  , orientation = Vertical
  , id = 0
  }

-- UPDATE

type Action
 = SetHand Hand
 | SetName String
 | SetScore Int
 | HandAction Hand.Action

update : Action -> Player -> Player
update action player = case action of
  HandAction handAction ->
    { player | hand = Hand.update handAction player.hand }
  SetName name ->
    { player | name = name }
  SetScore score ->
    { player | score = score }
  SetHand hand ->
    { player | hand = hand }

-- VIEW

view : Signal.Address Action -> Player -> Html
view address player =
  div
    [ class (playerClass player) ]
    [ playerName player, Hand.view (Signal.forwardTo address HandAction) player.hand ]

playerName : Player -> Html
playerName player =
  div
    [ class "name" ]
    [ text player.name ]

playerClass : Player -> String
playerClass player = "player " ++ case player.orientation of
  Vertical -> "vertical"
  Horizontal -> "horizontal"
