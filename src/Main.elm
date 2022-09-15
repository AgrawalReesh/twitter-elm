module Main exposing (main)

import Deck
import Element exposing (Element, centerX, column, el, fill, height, image, maximum, padding, px, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Widgets



-- stage 1 : top row has a fix width and is center          300 600 300 => 1200
-- stage 2 : below a 1200 the nav bar shrinks to icons only 75 600 300  => 975
-- stage 3 : below (fix width length - diff of nav bar size) the top row width changes to fill width
-- stage 4 : below (above length - diff of widgets bar) the deck width changes to a min with fill


main =
    Element.layout
        [ Background.color (rgb255 0 0 0)
        ]
        mainRow


mainRow : Element ()
mainRow =
    row
        [ centerX
        , width (maximum 1200 fill)
        ]
        [ nav, deck, widgets ]


nav : Element msg
nav =
    el
        [ padding 10
        , width (maximum 300 fill)
        , height fill
        ]
        (column
            [ padding 20, spacing 20 ]
            [ navElement "../assets/twitter.png" ""
            , navElement "../assets/home-icon.png" "Home"
            , navElement "../assets/hash.png" "Explore"
            , navElement "../assets/notifications.png" "Notifications"
            , tweetButton
            ]
        )


navElement : String -> String -> Element msg
navElement imgSrc txt =
    Input.button []
        { onPress = Nothing
        , label =
            row [ Font.color (rgb255 255 255 255), spacing 20 ]
                [ image
                    [ width (px 30)
                    , height (px 30)
                    ]
                    { src = imgSrc
                    , description = txt
                    }
                , text txt
                ]
        }


tweetButton : Element msg
tweetButton =
    Input.button
        [ Background.color (rgb255 27 149 224)
        , Element.mouseOver [ Background.color (rgb255 70 149 255) ]
        , Border.rounded 30
        , Font.color (rgb255 255 255 255)
        , width (px 200)
        , height (px 50)
        , Font.center
        , Font.bold
        , Font.family [ Font.sansSerif ]
        , Font.size 16
        ]
        { onPress = Nothing
        , label = text "Tweet"
        }


deck : Element ()
deck =
    Deck.deck


widgets : Element ()
widgets =
    Widgets.widgets
