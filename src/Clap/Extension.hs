{-# LANGUAGE MultiWayIf #-}

module Clap.Extension where

import Clap.Interface.Extension.Foreign.Gui
import Clap.Interface.Extension.Gui as Gui
import Clap.Interface.Extension.Log as Log
import Foreign.Ptr
import Foreign.Marshal.Utils

data HostExtensions = HostExtensions
    { hostExtensions_gui :: HostGuiHandle
    , hostExtensions_log :: HostLogHandle
    } deriving (Show)

initializeExtensions :: IO HostExtensions
initializeExtensions = do
    guiHandle <- new $ C'clap_host_gui 
        { c'clap_host_gui'resize_hints_changed = nullFunPtr
        , c'clap_host_gui'request_resize = nullFunPtr
        , c'clap_host_gui'request_show = nullFunPtr
        , c'clap_host_gui'request_hide = nullFunPtr
        , c'clap_host_gui'closed = nullFunPtr
        }
    logHandle <- createHostLog $ \_hostHandle logLevel message ->
        putStrLn $ Prelude.show logLevel <> ": " <> message 
    pure $ HostExtensions
        { hostExtensions_gui = guiHandle
        , hostExtensions_log = logHandle
        }

getExtension :: HostExtensions -> String -> IO (Ptr ())
getExtension extensions name = pure $ if
    | name == Gui.extensionId -> castPtr $ hostExtensions_gui extensions
    | name == Log.extensionId -> castPtr $ hostExtensions_log extensions
    | otherwise -> nullPtr