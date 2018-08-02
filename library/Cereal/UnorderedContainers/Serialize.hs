{-|
Orphan instances of "Serialize".
-}
module Cereal.UnorderedContainers.Serialize
where

import Cereal.UnorderedContainers.Prelude
import qualified Cereal.UnorderedContainers.Put as Put
import qualified Cereal.UnorderedContainers.Get as Get
import qualified Cereal.UnorderedContainers.Extras.StrictHashMap as StrictHashMap


instance (Eq key, Hashable key, Serialize key, Serialize value) => Serialize (StrictHashMap.HashMap key value) where
  put = Put.strictHashMap put put put
  get = Get.strictHashMap get get get
