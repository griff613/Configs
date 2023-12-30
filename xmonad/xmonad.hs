--
import XMonad
import Data.Monoid
import System.Exit
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops -- this just makes xmonad both ICCCM and EVMH compliant.
import XMonad.Util.Loggers
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Layout.Spacing

myTerminal      = "alacritty"
myBorderWidth   = 3
myModMask       = mod4Mask
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#03C04A"
myWorkspaces    = [" Crome "," Term "," Code ","4","5","6","7","8","9"]
myHiddenColor :: String
myHiddenColor = "asoeuth"


-------------------------------- XMOBAR ----------------------------------
myXmobarPP :: PP
myXmobarPP = def
      { ppSep             = orange " \xf01d8 " 
    , ppTitleSanitize     = xmobarStrip
    , ppCurrent           = wrap " " "" . xmobarBorder "Bottom" "#F8FC03" 2
    , ppHidden            = white . wrap " " ""
    --, ppRename            = String -> WindowSpace -> String
    , ppHiddenNoWindows   = lowWhite . wrap " " ""
    , ppUrgent            = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _,  wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
    where
    formatFocused   = wrap (orange    "[ ") (orange    " ] ") . orange . ppWindow
    formatUnfocused = wrap (lowWhite   " [ ") (lowWhite   " ]") . lowWhite    . ppWindow
--------------------------------------------------------------------------

    -- | Windows should have *some* title, which should not not exc
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 80
    blue, lowWhite, magenta, red, white, yellow, green, orange :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
    green    = xmobarColor "#39ff14" ""
    orange   = xmobarColor "#F8FC03" ""
    
-------------------------------- Startup Hook ----------------------------------
myStartupHook = do
  spawnOnce "nitrogen --restore &"
  spawnOnce "picom &"
--------------------------------------------------------------------------------

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_t     ), spawn $ XMonad.terminal conf)          -- launch a terminal
    , ((modm,               xK_p     ), spawn "dmenu_run")                     -- launch dmenu
    , ((modm,               xK_b     ), spawn "google-chrome-stable")          -- launch chrome
    , ((modm,               xK_v     ), spawn "code")          -- launch chrome
    , ((modm,               xK_c     ), kill)                                  -- close focused window
    , ((modm,               xK_space ), sendMessage NextLayout)                -- Rotate through the available layout algorithms
    , ((modm,               xK_n     ), refresh)                               -- Resize viewed windows to the correct size
    , ((modm,               xK_Tab   ), windows W.focusDown)                   -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)                   -- Move focus to the next window
    , ((modm,               xK_k     ), windows W.focusUp  )                   -- Move focus to the previous window
    , ((modm,               xK_m     ), windows W.focusMaster  )               -- Move focus to the master window
    , ((modm,               xK_Return), windows W.swapMaster)                  -- Swap the focused window and the master window
    , ((modm,               xK_h     ), sendMessage Shrink)                    -- Shrink the master area
    , ((modm,               xK_l     ), sendMessage Expand)                    -- Expand the master area
    , ((modm,               xK_comma ), sendMessage (IncMasterN 1))            -- Increment the number of windows in the master area
    , ((modm,               xK_period), sendMessage (IncMasterN (-1)))         -- Deincrement the number of windows in the master are
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")-- Restart xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))             -- Quit xmonad
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )                  -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )                  -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")                         -- launch gmrun
    ]++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withSB (statusBarProp "xmobar -x 0 ~/.config/xmobar/sceptre.xmobarrc" (pure myXmobarPP))  
     . withSB (statusBarProp "xmobar -x 1 ~/.config/xmobar/samsung.xmobarrc" (pure myXmobarPP)) 
     $ myConfig

myConfig = def
  { keys                = myKeys
  , modMask             = myModMask
  , layoutHook          = spacingWithEdge 2 $ myLayout
  , terminal            = myTerminal
  , borderWidth         = myBorderWidth
  , normalBorderColor   = myNormalBorderColor
  , focusedBorderColor  = myFocusedBorderColor
  , workspaces          = myWorkspaces
  , startupHook         = myStartupHook
  }

