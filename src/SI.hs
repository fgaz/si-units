{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
module SI where

import Numeric.NumType.DK.Integers

newtype SI (m::TypeInt)
           (s::TypeInt) -- ^ Seconds
           (kg::TypeInt)
           (a::TypeInt)
           (k::TypeInt)
           (cd::TypeInt)
           = SI Double deriving Show

type Dimensionless = SI Zero Zero Zero Zero Zero Zero

type Metre (n::TypeInt) = SI n Zero Zero Zero Zero Zero
type Second (n::TypeInt) = SI Zero n Zero Zero Zero Zero
type Kilogram (n::TypeInt) = SI Zero Zero n Zero Zero Zero
type Ampere (n::TypeInt) = SI Zero Zero Zero n Zero Zero
type Kelvin (n::TypeInt) = SI Zero Zero Zero Zero n Zero
type Candela (n::TypeInt) = SI Zero Zero Zero Zero Zero n
-- type Mole (n::LiftedInt) = SI

type Metre1 = Metre Pos1
type Second1 = Second Pos1
type Kilogram1 = Kilogram Pos1
type Ampere1 = Ampere Pos1
type Kelvin1 = Kelvin Pos1
type Candela1 = Candela Pos1

type Hertz = Second Neg1

addSI :: SI m s kg a k cd
      -> SI m s a k cd kg
      -> SI m s kg a k cd
addSI (SI n) (SI n') = SI (n Prelude.+ n')

subtractSI :: SI m s kg a k cd
           -> SI m s a k cd kg
           -> SI m s kg a k cd
subtractSI (SI n) (SI n') = SI (n Prelude.- n')

multSI :: SI m1 s1 kg1 a1 k1 cd1
       -> SI m2 s2 kg2 a2 k2 cd2
       -> SI (m1 + m2)
             (s1 + s2)
             (kg1 + kg2)
             (a1 + a2)
             (k1 + k2)
             (cd1 + cd2)
multSI (SI n) (SI n') = SI (n Prelude.* n')

divSI :: SI m1 s1 kg1 a1 k1 cd1
      -> SI m2 s2 kg2 a2 k2 cd2
      -> SI (m1 - m2)
            (s1 - s2)
            (kg1 - kg2)
            (a1 - a2)
            (k1 - k2)
            (cd1 - cd2)
divSI (SI n) (SI n') = SI (n Prelude./ n')

