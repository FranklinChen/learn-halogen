module ParentChildRelationships.ParentlikeComponents.SimpleChild.InputOnly where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Scaffolding.ParentChildRenderer.ParentlikeComponents.SingleChildInputOnlyRenderer (ParentAction(..), RenderParentWithInputOnlyChild, runParentWithInputOnlyChild, singleChild_input_NoMessageNoQuery)

main :: Effect Unit
main = runParentWithInputOnlyChild renderParentWithInputOnlyChild

-- | A basic parent that only acts like a container.
-- | To keep things simpler, it is static and only renders a static child.
renderParentWithInputOnlyChild :: RenderParentWithInputOnlyChild
renderParentWithInputOnlyChild childComponent inputValue =
  HH.div_
    [ HH.div_ [ HH.text "This is the parent component " ]
    , HH.button
      [ HE.onClick \_ -> Just RandomState]
      [ HH.text "Click to send a random integer (the `input` value) \
                \to the child"
      ]
    , singleChild_input_NoMessageNoQuery childComponent inputValue
    ]
