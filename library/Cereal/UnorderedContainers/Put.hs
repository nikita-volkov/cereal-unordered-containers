module Cereal.UnorderedContainers.Put
where

import Cereal.UnorderedContainers.Prelude
import qualified Cereal.UnorderedContainers.Extras.StrictHashMap as StrictHashMap


strictHashMap :: Putter Int -> Putter key -> Putter value -> Putter (StrictHashMap.HashMap key value)
strictHashMap int key value x = size *> associations where
  size = int (StrictHashMap.size x)
  associations = StrictHashMap.traverse_ association x
  association keyValue valueValue = key keyValue *> value valueValue
