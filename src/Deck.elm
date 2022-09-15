module Deck exposing (..)

import Element exposing (Element, alignLeft, alignRight, alignTop, clip, column, fill, height, image, maximum, minimum, padding, px, rgb255, rgba, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input exposing (labelHidden, placeholder)


deck : Element ()
deck =
    column
        [ Border.color (rgba 255 255 255 0.1)
        , Border.widthEach { bottom = 0, left = 1, top = 0, right = 1 }
        , width (maximum 600 fill)
        , height fill
        ]
        [ home, tweet, tweets ]


home : Element ()
home =
    row
        [ width fill
        , padding 10
        , Border.color (rgba 255 255 255 0.1)
        , Border.widthEach { bottom = 1, left = 0, top = 0, right = 0 }
        , Font.color (rgb255 255 255 255)
        ]
        [ text "Home"
        , image
            [ width (px 25)
            , height (px 25)
            , alignRight
            ]
            { src = "../assets/top-tweets.png"
            , description = "top-tweet"
            }
        ]


tweet : Element ()
tweet =
    row
        [ padding 10
        , spacing 10
        , width fill
        , height fill
        ]
        [ profileImage, tweetBox ]


profileImage : Element msg
profileImage =
    image
        [ height (px 50)
        , width (px 50)
        , Border.rounded 50
        , clip
        , alignLeft
        , alignTop
        ]
        { src = "../assets/profile.png"
        , description = "profile"
        }


tweetBox : Element ()
tweetBox =
    column [ width fill, height fill ]
        [ Input.multiline
            [ width fill
            , height (maximum 500 (px 50))
            , Background.color (rgb255 0 0 0)
            , Border.color (rgb255 0 0 0)
            , Font.color (rgb255 255 255 255)
            ]
            { onChange = \_ -> ()
            , text = ""
            , placeholder = Just (placeholder [] (text "What's happening?"))
            , label = labelHidden ""
            , spellcheck = True
            }
        ]


tweets : Element msg
tweets =
    Element.none
