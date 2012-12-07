import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
-- import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.SetWMName
import XMonad.Actions.CopyWindow
import System.IO

myManageHook :: ManageHook
myManageHook = composeAll
   [ manageDocks
   , manageHook defaultConfig
   , className =? "Xfce4-notifyd" --> doIgnore
   ]

main = xmonad $ defaultConfig
              { manageHook = myManageHook
              , layoutHook = avoidStruts $ layoutHook defaultConfig
              , modMask    = mod4Mask
              , startupHook = setWMName "LG3D"
              } `additionalKeys`
              [ ((mod4Mask, xK_m ), spawn "mute")
              , ((mod4Mask, xK_s ), spawn "snap")
              ]