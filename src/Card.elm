module Card where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import String

-- MODEL

type Suit = Spades | Hearts | Clubs | Diamonds
type Value = Ace | King | Queen | Jack | Value Int
type Face = Up | Down
type alias Card =
  { face : Face
  , value : Value
  , suit : Suit
  }

valueString : Value -> String
valueString v =
  case v of
    Ace -> "ace"
    King -> "king"
    Queen -> "queen"
    Jack -> "jack"
    Value i -> toString i

init : Face -> Value -> Suit -> Card
init f v s =
  { face = f
  , value = v
  , suit = s
  }

-- UPDATE

type Action
    = Flip

update : Action -> Card -> Card
update action model =
  case action of
    Flip ->
      { model | face = flipOver model.face }

flipOver : Face -> Face
flipOver f =
  case f of
    Up -> Down
    Down -> Up

-- VIEW

view : Signal.Address Action -> Card -> Html
view address model =
  div
    [ toClass model |> class, onClick address Flip ]
    ( List.map (text) (cardStrings model) )

cardStrings : Card -> List String
cardStrings card =
  []
  -- [toString card.face, toString card.suit, valueString card.value]

toClass : Card -> String
toClass model =
  case model.face of
    Up ->
      "card "
      ++ (model.suit |> toString |> String.toLower)
      ++ "-"
      ++ (model.value |> valueString)
    Down ->
      "card down"
