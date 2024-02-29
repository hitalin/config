-------------------------------------------------------------------------------
-- Import modules
-------------------------------------------------------------------------------
import qualified Data.Map as M
import Control.Monad (liftM2)          -- myManageHookShift
import Data.Monoid
import System.IO                       -- for xmobar

import XMonad
import qualified XMonad.StackSet as W  -- myManageHookShift

import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import qualified XMonad.Actions.FlexibleResize as Flex -- flexible resize
import XMonad.Actions.FloatKeys
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WindowGo

import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.ManageHelpers

import XMonad.Layout
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.LayoutScreens
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.TwoPane
import XMonad.Layout.ThreeColumns

import XMonad.Prompt
import XMonad.Prompt.Window            -- pops up a prompt with window names
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Util.SpawnOnce

import Graphics.X11.ExtraTypes.XF86

import XMonad.Config.Desktop           -- for chromium

-- xmonad contrib
--import XMonad.Actions.GridSelect (goToSelected, defaultGSConfig)
--import XMonad.Prompt.Shell
-------------------------------------------------------------------------------
-- local variables
-------------------------------------------------------------------------------
myWorkspaces = ["1", "2", "3", "4", "5"]
modm = mod4Mask

-- Color Setting
colorBlue      = "#868bae"
colorGreen     = "#00d700"
colorRed       = "#ff005f"
colorGray      = "#666666"
colorWhite     = "#bdbdbd"
colorGrayAlt   = "#eceff1"
colorNormalbg  = "#1c1c1c"
colorfg        = "#a8b6b8"

-- Border width
borderwidth = 1

-- Border color
mynormalBorderColor  = "#262626"
myfocusedBorderColor = "#ededed"

-- Float window control width
moveWD = borderwidth
resizeWD = 2*borderwidth

-- gapwidth
gapwidth  = 2
gwU = 32
gwD = 1
gwL = 1
gwR = 1

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------
main :: IO ()
main = do
    wsbar <- spawnPipe myWsBar
    xmonad $ ewmh desktopConfig
       { borderWidth        = borderwidth
       , terminal           = "wezterm"
       , focusFollowsMouse  = True
       , normalBorderColor  = mynormalBorderColor
       , focusedBorderColor = myfocusedBorderColor
       , startupHook        = myStartupHook
       , manageHook         = myManageHookShift <+>
                              myManageHookFloat <+>
                              manageDocks
       , layoutHook         = avoidStruts $ ( toggleLayouts (noBorders Full)
                                            $ myLayout
                                            )
        -- xmobar setting
       , logHook            = myLogHook wsbar
                                >> updatePointer (0.5, 0.5) (0, 0)
       --, handleEventHook    = fullscreenEventHook
       , workspaces         = myWorkspaces
       , modMask            = modm
       --, mouseBindings      = newMouse
       }

       ------------------------------------------------------------------------
       -- Define keys to remove
       ------------------------------------------------------------------------

       `removeKeysP`
       [
       -- Unused gmrun binding
       "M-S-p",
       -- Unused close window binding
       "M-S-c",
       "M-S-<Return>"
       ]

       ------------------------------------------------------------------------
       -- Keymap: window operations
       ------------------------------------------------------------------------

       `additionalKeysP`
       [
       -- Shrink / Expand the focused window
         ("M-,"    , sendMessage Shrink)
       , ("M-."    , sendMessage Expand)
       , ("M-z"    , sendMessage MirrorShrink)
       , ("M-a"    , sendMessage MirrorExpand)
       -- Close the focused window
       , ("M-c"    , kill1)
       -- Toggle layout (Fullscreen mode)
       , ("M-f"    , sendMessage ToggleLayout)
       -- Move the focused window
       , ("M-C-<R>", withFocused (keysMoveWindow (2,0)))
       , ("M-C-<L>", withFocused (keysMoveWindow (-2,0)))
       , ("M-C-<U>", withFocused (keysMoveWindow (0,-2)))
       , ("M-C-<D>", withFocused (keysMoveWindow (0,2)))
       -- Resize the focused window
       , ("M-s"    , withFocused (keysResizeWindow (-6,-6) (0.5,0.5)))
       , ("M-i"    , withFocused (keysResizeWindow (6,6) (0.5,0.5)))
       -- Increase / Decrese the number of master pane
       , ("M-S-;"  , sendMessage $ IncMasterN 1)
       , ("M--"    , sendMessage $ IncMasterN (-1))
       -- Go to the next / previous workspace
       , ("M-<R>"  , nextWS )
       , ("M-<L>"  , prevWS )
       , ("M-l"    , nextWS )
       , ("M-h"    , prevWS )
       -- Shift the focused window to the next / previous workspace
       , ("M-S-<R>", shiftToNext)
       , ("M-S-<L>", shiftToPrev)
       , ("M-S-l"  , shiftToNext)
       , ("M-S-h"  , shiftToPrev)
       -- CopyWindow
       , ("M-v"    , windows copyToAll)
       , ("M-S-v"  , killAllOtherCopies)
       -- Move the focus down / up
       , ("M-<D>"  , windows W.focusDown)
       , ("M-<U>"  , windows W.focusUp)
       , ("M-j"    , windows W.focusDown)
       , ("M-k"    , windows W.focusUp)
       -- Swap the focused window down / up
       , ("M-S-j"  , windows W.swapDown)
       , ("M-S-k"  , windows W.swapUp)
       -- Shift the focused window to the master window
       , ("M-S-m"  , windows W.shiftMaster)
       -- Move the focus to next screen (multi screen)
       , ("M-<Tab>", nextScreen)
       -- Now we have more than one screen by dividing a single screen
       , ("M-C-<Space>", layoutScreens 2 (TwoPane 0.5 0.5))
       , ("M-C-S-<Space>", rescreen)
       ]

       ------------------------------------------------------------------------
       -- Keymap: moving workspace by number
       ------------------------------------------------------------------------
       -- mod-[1..9]          Switch to workspace N
       -- mod-shift-[1..9]    Move window to workspace N
       -- mod-control-[1..9]  Copy window to workspace N

       `additionalKeys`
       [ ((modm .|. m, k), windows $ f i)
         | (i, k) <- zip myWorkspaces
                     [ xK_exclam, xK_at, xK_numbersign
                     , xK_dollar, xK_percent, xK_asciicircum
                     , xK_ampersand, xK_asterisk, xK_parenleft
                     , xK_parenright
                     ]
         , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]

       ------------------------------------------------------------------------
       -- Keymap: custom commands
       ------------------------------------------------------------------------
       `additionalKeysP`
       [
       -- Launch terminal
         ("M-<Return>", spawn "wezterm")
       -- Launch terminal with a float window
       -- Toggle touchpad
       , ("C-<Escape>", spawn "touchpad_toggle.sh")
       -- Toggle trackpoint (Lenovo PC)
       , ("M1-<Escape>", spawn "trackpoint_toggle.sh")
       -- for xmonad contrib
       --, ("M-g"      , goToSelected defaultGSConfig)
       --, ("M-p"      , shellPrompt defaultXPConfig)
       ]

-------------------------------------------------------------------------------
-- myLayout:          Handle Window behaveior
-------------------------------------------------------------------------------
myLayout = spacing gapwidth $ gaps [(U, gwU),(D, gwD),(L, gwL),(R, gwR)]
                 (ResizableTall 1 (1/55) (1/2) [])
             ||| (TwoPane (1/55) (1/2))
             ||| Simplest
             ||| ThreeCol 1 (3/100) (1/2)

-------------------------------------------------------------------------------
-- myStartupHook:     Start up applications
-------------------------------------------------------------------------------
myStartupHook = do
        spawnOnce "dropbox"
        spawnOnce "picom -b --config $HOME/config/picom/picom.conf"
        spawnOnce "sh $HOME/config/feh/.fehbg"
        spawnOnce "LC_CTYPE=ja_JP.UTF-8 emacs --daemon"

-------------------------------------------------------------------------------
-- myManageHookShift: some window must created there
-------------------------------------------------------------------------------
myManageHookShift = composeAll
            -- if you want to know className, type "$ xprop|grep CLASS" on shell
            [ className =? "brave"       --> mydoShift "2"
            ]
             where mydoShift = doF . liftM2 (.) W.greedyView W.shift

-------------------------------------------------------------------------------
-- myManageHookFloat: new window will created in Float mode
-------------------------------------------------------------------------------
myManageHookFloat = composeAll
    [
      className =? "feh"              --> doCenterFloat
    , title     =? "urxvt_float"      --> doSideFloat SC
    , isFullscreen                    --> doFullFloat
    ]

-------------------------------------------------------------------------------
-- myLogHook:         loghock settings
-------------------------------------------------------------------------------
myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

-------------------------------------------------------------------------------
-- myWsBar:           xmobar settings
-------------------------------------------------------------------------------
myWsBar = "xmobar $HOME/.config/xmonad/.xmobarrc"

wsPP = xmobarPP { ppOrder           = \(ws:l:t:_)  -> [ws,t]
                , ppCurrent         = xmobarColor colorRed      colorNormalbg
                , ppUrgent          = xmobarColor colorGray     colorNormalbg
                , ppVisible         = xmobarColor colorRed      colorNormalbg
                , ppHidden          = xmobarColor colorGray     colorNormalbg
                , ppHiddenNoWindows = xmobarColor colorGray     colorNormalbg
                , ppTitle           = xmobarColor colorRed      colorNormalbg
                , ppOutput          = putStrLn
                , ppWsSep           = " "
                , ppSep             = "  "
                }

-------------------------------------------------------------------------------
-- myXPConfig:        XPConfig
-------------------------------------------------------------------------------
--myXPConfig = defaultXPConfig
--                { font              = "xft:Cica:size=12:antialias=true"
--                , fgColor           = colorfg
--                , bgColor           = colorNormalbg
--                , borderColor       = colorNormalbg
--                , height            = 20
--                , promptBorderWidth = 1
--                , autoComplete      = Just 100000
--                , bgHLight          = colorWhite
--                , fgHLight          = colorNormalbg
--                , position          = Bottom
--                }

-------------------------------------------------------------------------------
-- newMouse:         Right click is used for resizing window
-------------------------------------------------------------------------------
--myMouse x = [ ((modm, button3), (\w -> focus w >> Flex.mouseResizeWindow w)) ]
--newMouse x = M.union (mouseBindings defaultConfig x) (M.fromList (myMouse x))
