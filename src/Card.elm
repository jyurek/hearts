module Card where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import String

-- MODEL

type Suit = Spades | Hearts | Clubs | Diamonds
type Value = Ace | King | Queen | Jack | Value Int
type Face = Up | Down
type Card = Card { face : Face, value : Value, suit : Suit } | UnknownCard

valueString : Value -> String
valueString v =
  case v of
    Ace -> "ace"
    King -> "king"
    Queen -> "queen"
    Jack -> "jack"
    Value i -> toString i

init : Face -> Value -> Suit -> Card
init f v s = Card { face = f , value = v , suit = s }

initUnknownCard : Card
initUnknownCard = UnknownCard

-- UPDATE

type Action
    = Flip

update : Action -> Card -> Card
update action model =
  case model of
    UnknownCard -> UnknownCard
    Card card -> 
      case action of
        Flip ->
          Card { card | face = flipOver card.face }

canFlip : Card -> Bool
canFlip card =
  case card of
    UnknownCard -> False
    _ -> True

flipOver : Face -> Face
flipOver f =
  case f of
    Up -> Down
    Down -> Up

-- VIEW

view : Signal.Address Action -> Card -> Html
view address card =
  div
    [ class <| toClass card, onClick address Flip ]
    ( List.map (text) (cardStrings card) )

cardStrings : Card -> List String
cardStrings card =
  []
  -- [toString card.face, toString card.suit, valueString card.value]

toClass : Card -> String
toClass card =
  case card of
    UnknownCard ->
      "card down"
    Card card' ->
      case card'.face of
        Up ->
          "card "
          ++ (card'.suit |> toString |> String.toLower)
          ++ "-"
          ++ (card'.value |> valueString)
        Down ->
          "card down"
