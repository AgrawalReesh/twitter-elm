module Widgets exposing (..)

import Element exposing (Element, alpha, column, fill, height, image, maximum, minimum, padding, px, rgba, rgba255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input


widgets : Element ()
widgets =
    column
        [ padding 10
        , width (maximum 300 fill)
        , height fill
        ]
        [ search, news, followSuggestions ]


search : Element ()
search =
    Input.button
        [ Background.color (rgba 255 255 255 0.1)
        , width fill
        , height (px 50)
        , Border.rounded 30
        , padding 10
        ]
        { onPress = Nothing
        , label =
            row [ Font.color (rgba255 255 255 255 0.1), spacing 20 ]
                [ image
                    [ width (px 30)
                    , height (px 30)
                    , alpha 0.1
                    ]
                    { src = "../assets/search.png"
                    , description = "Search Twitter"
                    }
                , text "Search Twitter"
                ]
        }


news : Element ()
news =
    Element.none


followSuggestions : Element ()
followSuggestions =
    Element.none
