import qualified Data.Map as MP
import qualified Data.List as DL
import qualified Data.Char as DC

encode :: Int -> String -> String  
encode shift msg = 
    let ords = map DC.ord msg
        shifted = map (+ shift) ords  
    in  map DC.chr shifted 

--or in another way

encode_a shift msg =  map (DC.chr . (+ shift) . DC.ord) msg

decode :: Int -> String -> String  
decode shift msg = encode (negate shift) msg 
