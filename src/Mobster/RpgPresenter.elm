module Mobster.RpgPresenter exposing (..)

import Mobster.Data exposing (MobsterData)
import Mobster.Rpg exposing (Experience)


type RpgRole
    = Driver
    | Navigator
    | Researcher
    | Sponsor


type alias RpgMobster =
    { role : RpgRole
    , experience : Experience
    , name : String
    , index : Int
    }


present : MobsterData -> List RpgMobster
present mobsterData =
    mobsterData.mobsters
        |> List.take 4
        |> List.indexedMap toRpgMobster


toRpgMobster index mobsterName =
    RpgMobster (getRoleForIndex index) [] mobsterName index


getRoleForIndex index =
    case index of
        0 ->
            Driver

        1 ->
            Navigator

        2 ->
            Researcher

        3 ->
            Sponsor

        _ ->
            Sponsor
