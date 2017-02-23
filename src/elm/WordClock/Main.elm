module WordClock.Main exposing (..)

import Html exposing (Html, program, h2, div, text)
import Html.Events as Events
import Html.Attributes exposing (..)
import Time exposing (Time)
import WordClock.Util exposing (..)
import Date as Date
import Tuple exposing (..)

main : Program Never Model Msg
main =
  program { init = init, view = view, update = update, subscriptions = subs }


-- MODEL

type alias Model = (Time, Bool)


-- VIEW

view : Model -> Html Msg
view model =
  -- div []
  --   [  div [] [ text (toString (tel model)) ]
  --   ]
  let
    (iseju, wakati) =
      (tellTime (first model))
    igba =
      Date.fromTime (first model) |> Date.hour |> yGreetings
  in
      div [class "hour"]
        [  h2 [Events.onDoubleClick DoubleClick] [ text (iseju ) ]
          , h2 [Events.onDoubleClick DoubleClick] [ text (wakati) ]
          , h2 [Events.onDoubleClick DoubleClick] [ text (igba) ]
        ]


-- UPDATE


type Msg
  = Tick Time
  | DoubleClick


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      ((,) newTime (second model), Cmd.none)
    DoubleClick ->
      ((,) (Tuple.first model) (not (second model)), Cmd.none)


init : (Model, Cmd Msg)
init =
  ((0, False), Cmd.none)


subs : Model -> Sub Msg
subs model =
  Time.every Time.second Tick
