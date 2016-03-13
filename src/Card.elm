module Card (Model, init, Action, update, view, Orientation(..), Value(..), Suit(..)) where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import String exposing (toLower)

-- MODEL

type Suit = Spades | Hearts | Clubs | Diamonds
type Value = Ace | King | Queen | Jack | Value Int
type Orientation = Up | Down
type alias Model =
  { orientation : Orientation
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

init : Orientation -> Value -> Suit -> Model
init o v s =
  { orientation = o
  , value = v
  , suit = s
  }

-- UPDATE

type Action
    = Flip

update : Action -> Model -> Model
update action model =
  case action of
    Flip ->
      { model | orientation = flipOver model.orientation }

flipOver : Orientation -> Orientation
flipOver o =
  case o of
    Up -> Down
    Down -> Up

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div
    [ toClass model |> class ]
    [ text "" ]

toClass : Model -> String
toClass model =
  case model.orientation of
    Up ->
      "card " ++ (model.suit |> toString |> toLower) ++ "-" ++ (model.value |> valueString)
    Down ->
      "card down"
