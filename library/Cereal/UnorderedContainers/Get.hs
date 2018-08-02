module Cereal.UnorderedContainers.Get
where

import Cereal.UnorderedContainers.Prelude
import qualified Cereal.UnorderedContainers.Extras.StrictHashMap as StrictHashMap


strictHashMap :: (Eq key, Hashable key) => Get Int -> Get key -> Get value -> Get (StrictHashMap.HashMap key value)
strictHashMap int key value = size >>= associations where
  size = int
  associations size = StrictHashMap.replicateM size ((,) <$> key <*> value)
