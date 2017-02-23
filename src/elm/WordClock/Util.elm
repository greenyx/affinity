module WordClock.Util exposing (..)

import Date exposing (..)
import Time exposing (Time)
tellTime : Time -> (String, String)
tellTime a =
  hoursAndMinute ( hour <|fromTime a, minute <|fromTime a)

-- -- Tell the time, take a time object and return a tuple of time
--  -- in word hours and minutes
--  -- ago {time} koja {iseju time}
--  --

-- tellDate

-- Convert a number between one and thirty to yoruba equivalent
yNumbers: Int -> String
yNumbers a =
  case a of
    1 -> "kan"
    2 -> "méjì"
    3 -> "mẹ́ta"
    4 -> "mẹ́rin"
    5 -> "márùn"
    6 -> "mẹ́fà"
    7 -> "méje"
    8 -> "mẹ́jọ"
    9 -> "mẹ́sán"
    10 -> "mẹ́wà"
    11 -> "mọ̀kànlá"
    12 -> "méjìlá"
    13 -> "mẹ́tàlá"
    14 -> "mẹ́rìnlá"
    15 -> "màrúndínlógún"
    16 -> "mẹ́rìndínlógún"
    17 -> "mẹ́tàdínlógún"
    18 -> "méjìdínlógún"
    19 -> "mọ́kàndínlógún"
    20 -> "ogún"
    21 -> "mọ́kànlélógún"
    22 -> "méjìlélógún"
    23 -> "mẹ́tàlélógún"
    24 -> "mẹ́rìnlélógún"
    25 -> "márùndínlọ́gbọ̀n"
    26 -> "mẹ́rìndínlọ́gbọ̀n"
    27 -> "mẹ́tàdínlọ́gbọ̀n"
    28 -> "méjídínlọ́gbọ̀n"
    29 -> "mọ́kàndínlọ́gbọ̀n"
    _ -> "Toooooooooo"


yDays: Day -> String
yDays a =
  case a of
    Mon -> "ajé"
    Tue -> "ìṣẹ́gun"
    Wed -> "ọjọ́rú"
    Thu -> "ọjọ́bọ̀"
    Fri -> "ẹtì"
    Sat -> "àbá mẹ́ta"
    Sun -> "àìkú"
-- Ọjọ́ ȯsė

yMonths: Month -> String
yMonths a =
  case a of
    Jan -> "ṣẹ́rẹ́"
    Feb -> "èrèlè"
    Mar -> "ẹrẹ̀nà"
    Apr -> "ìgbé"
    May -> "ẹ̀bibi"
    Jun -> "òkúdu"
    Jul -> "agẹmọ"
    Aug -> "ògún"
    Sep -> "òwéré"
    Oct -> "ọ̀wàrà"
    Nov -> "bélú"
    Dec -> "ọ̀pẹ̀"

hoursAndMinute : ( Int, number ) -> ( String, String )
hoursAndMinute (a, b) =
  if b == 00 then
    ("agogo" ++ yNumbers(a),"")
  else if b == 30 then
    ("agogo" ++ yNumbers(a),"àti ààbò")
  else if b < 30 then
    ("agogo" ++ yNumbers(a),"kojá ìṣéjú" ++ yNumbers(b))
  else if b > 30 then
    ("agogo" ++ yNumbers (a + 1),"kù ìṣéjú" ++ yNumbers( 60 - b))
  else ("","")


yGreetings : Int -> String
yGreetings a =
  if a >= 0 && a <= 3 then
    "òru"
    else if a > 3 && a < 12 then
      "òwúrò"
    else if a >= 12 && a < 17 then
      "òsán"
    else if a >= 17 && a <= 19 then
      "ìròlé"
    else if a > 19 && a <= 23 then
      "alé"
    else ""
