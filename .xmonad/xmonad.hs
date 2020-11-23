
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.SpawnOnce
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


myStartupHook = do
  spawnOnce "nitrogen --restore &"

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    tiled = spacingRaw False (Border 15 0 15 0) True (Border 0 15 0 15) True $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100


main :: IO()
main = do
  xmproc <- spawnPipe "xmobar -x 0"
  xmonad $ docks def
    {
       modMask = mod4Mask
     , focusedBorderColor = "#0000ff"
     , terminal = "termite"
     , borderWidth = 1
     , layoutHook = myLayout
     , logHook = dynamicLogWithPP xmobarPP
                 {
                   ppOutput = hPutStrLn xmproc
                 , ppSep = " | "
                 }
           -- , startupHook = myStartupHook
     }

