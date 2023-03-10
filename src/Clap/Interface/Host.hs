{-# LANGUAGE RankNTypes #-}

module Clap.Interface.Host where

import Clap.Interface.Foreign.Host
import Clap.Interface.Version
import Foreign.C.String
import Foreign.Marshal.Utils
import Foreign.Ptr

type HostHandle = Ptr C'clap_host

data HostConfig = HostConfig
    { hostConfig_clapVersion :: ClapVersion
    , hostConfig_data :: Ptr ()
    , hostConfig_name :: String
    , hostConfig_vendor :: String
    , hostConfig_url :: String
    , hostConfig_version :: String
    , hostConfig_getExtension :: HostHandle -> String -> IO (Ptr ()) 
    , hostConfig_requestRestart :: HostHandle -> IO ()
    , hostConfig_requestProcess :: HostHandle -> IO ()
    , hostConfig_requestCallback :: HostHandle -> IO ()
    }

defaultHostConfig :: HostConfig
defaultHostConfig = HostConfig
    { hostConfig_clapVersion = hostClapVersion
    , hostConfig_data = nullPtr
    , hostConfig_name = "CLAP demo host"
    , hostConfig_vendor = "unknown"
    , hostConfig_url = "github.com/JBetz/clap-hs"
    , hostConfig_version = "0.1"
    , hostConfig_getExtension = \_h _s -> pure nullPtr
    , hostConfig_requestRestart = \_h -> pure ()
    , hostConfig_requestProcess = \_h -> pure ()
    , hostConfig_requestCallback = \_h -> pure ()
    }

createHost :: HostConfig -> IO HostHandle
createHost (HostConfig clapVersion data' name vendor url version getExtension requestRestart requestProcess requestCallback) = do
    let clapVersionC = toStruct clapVersion
    nameC <- newCString name
    vendorC <- newCString vendor
    urlC <- newCString url
    versionC <- newCString version
    getExtensionC <- mk'get_extension (\cHostHandle cString -> do
        string <- peekCString cString
        getExtension cHostHandle string)
    requestRestartC <- mk'request_restart requestRestart
    requestProcessC <- mk'request_process requestProcess
    requestCallbackC <- mk'request_callback requestCallback
    new $ C'clap_host
        { c'clap_host'clap_version = clapVersionC
        , c'clap_host'host_data = data'
        , c'clap_host'name = nameC
        , c'clap_host'vendor = vendorC
        , c'clap_host'url = urlC
        , c'clap_host'version = versionC
        , c'clap_host'get_extension = getExtensionC
        , c'clap_host'request_restart = requestRestartC
        , c'clap_host'request_process = requestProcessC
        , c'clap_host'request_callback = requestCallbackC
        }